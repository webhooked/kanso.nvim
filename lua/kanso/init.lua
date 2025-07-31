local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable table<string, ColorSpec>
---@alias KansoColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias KansoColors { palette: PaletteColors, theme: ThemeColors }

--- default config
---@class KansoConfig
M.config = {
    bold = true,
    italics = true,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = {},
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    colors = { theme = { zen = {}, pearl = {}, ink = {}, all = {} }, palette = {} },
    ---@type fun(colors: KansoColorsSpec): table<string, table>
    overrides = function()
        return {}
    end,
    ---@type { dark: string, light: string }
    background = { dark = "ink", light = "ink" },
    theme = "ink",
    ---@type { dark: "default"|"saturated", light: "default"|"saturated" }|"default"|"saturated"
    foreground = "default",
    compile = false,
}

-- Store default config for comparison
M._DEFAULT_CONFIG = vim.deepcopy(M.config)

local function check_config(_)
    local err
    return not err
end

--- update global configuration with user settings
---@param config? KansoConfig user configuration
function M.setup(config)
    if check_config(config) then
        M.config = vim.tbl_deep_extend("force", M.config, config or {})
    else
        vim.notify("Kanso: Errors found while loading user config. Using default config.", vim.log.levels.ERROR)
    end
end

--- load the colorscheme
---@param theme? string
function M.load(theme)
    local utils = require("kanso.utils")

    -- If theme is explicitly provided, use it and disable background-based switching
    if theme then
        M._EXPLICIT_THEME = theme
    end

    -- Priority order for theme selection:
    -- 1. Explicitly loaded theme variant (e.g., :colorscheme kanso-zen)
    -- 2. Theme specified in config if different from default
    -- 3. Background-based selection if available
    -- 4. Fallback to config theme
    if M._EXPLICIT_THEME then
        theme = M._EXPLICIT_THEME
    elseif M.config.theme ~= M._DEFAULT_CONFIG.theme then
        -- User explicitly changed theme in config
        theme = M.config.theme
    elseif M.config.background and M.config.background[vim.o.background] then
        -- Use background-based selection
        theme = M.config.background[vim.o.background]
    else
        -- Use config theme (whether default or user-specified)
        theme = M.config.theme
    end
    M._CURRENT_THEME = theme
    
    -- Ensure the theme is available to colors module before any require() calls
    -- This prevents circular dependency issues when loading within lazy.nvim
    package.loaded["kanso"] = M

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "kanso"
    vim.o.termguicolors = true

    -- Setup autocommand to reload theme when background changes
    if not M._autocmd_created then
        M._autocmd_created = true
        vim.api.nvim_create_autocmd("OptionSet", {
            pattern = "background",
            callback = function()
                if vim.g.colors_name == "kanso" then
                    -- Clear cached modules to force reload
                    package.loaded["kanso.colors"] = nil
                    package.loaded["kanso.themes"] = nil
                    M.load()
                end
            end,
        })
    end

    if M.config.compile then
        if utils.load_compiled(theme) then
            return
        end

        M.compile()
        utils.load_compiled(theme)
    else
        local foreground_setting = type(M.config.foreground) == "table" and M.config.foreground[vim.o.background]
            or M.config.foreground
        ---@cast foreground_setting "default"|"saturated"
        local colors =
            require("kanso.colors").setup({ theme = theme, colors = M.config.colors, foreground = foreground_setting })
        local highlights = require("kanso.highlights").setup(colors, M.config)
        require("kanso.highlights").highlight(highlights, M.config.terminalColors and colors.theme.term or {})
    end
end

function M.compile()
    for theme, _ in pairs(require("kanso.themes")) do
        -- Compile both foreground variants if foreground is a table
        if type(M.config.foreground) == "table" then
            -- Compile for dark mode
            local colors_dark = require("kanso.colors").setup({
                theme = theme,
                colors = M.config.colors,
                foreground = M.config.foreground.dark,
            })
            local highlights_dark = require("kanso.highlights").setup(colors_dark, M.config)
            require("kanso.utils").compile(
                theme .. "_dark_" .. M.config.foreground.dark,
                highlights_dark,
                M.config.terminalColors and colors_dark.theme.term or {}
            )

            -- Compile for light mode
            local colors_light = require("kanso.colors").setup({
                theme = theme,
                colors = M.config.colors,
                foreground = M.config.foreground.light,
            })
            local highlights_light = require("kanso.highlights").setup(colors_light, M.config)
            require("kanso.utils").compile(
                theme .. "_light_" .. M.config.foreground.light,
                highlights_light,
                M.config.terminalColors and colors_light.theme.term or {}
            )
        else
            -- Fallback for backward compatibility
            local foreground_str = M.config.foreground
            ---@cast foreground_str "default"|"saturated"
            local colors = require("kanso.colors").setup({
                theme = theme,
                colors = M.config.colors,
                foreground = foreground_str,
            })
            local highlights = require("kanso.highlights").setup(colors, M.config)
            require("kanso.utils").compile(theme, highlights, M.config.terminalColors and colors.theme.term or {})
        end
    end
end

vim.api.nvim_create_user_command("KansoCompile", function()
    for mod, _ in pairs(package.loaded) do
        if mod:match("^kanso%.") then
            package.loaded[mod] = nil
        end
    end
    M.compile()
    vim.notify("Kanso: compiled successfully!", vim.log.levels.INFO)
    M.load(M._CURRENT_THEME)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

return M
