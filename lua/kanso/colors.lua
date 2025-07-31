---@class PaletteColors
local palette = {

    -- Zen Bg Shades
    zenBg0 = "#090E13",
    zenBg1 = "#1C1E25",
    zenBg2 = "#22262D",
    zenBg3 = "#393B44",

    -- Ink Bg Shades
    inkBg0 = "#14171d",
    inkBg1 = "#1f1f26",
    inkBg2 = "#22262D",
    inkBg3 = "#393B44",
    inkBg4 = "#4b4e57",

    -- Mist Bg Shades
    mistBg0 = "#22262D",
    mistBg1 = "#2a2c35",
    mistBg2 = "#393B44",
    mistBg3 = "#5C6066",

    -- Popup and Floats
    altBlue1 = "#223249",
    altBlue2 = "#2D4F67",

    -- Diff and Git
    diffGreen = "#2B3328",
    diffYellow = "#49443C",
    diffRed = "#43242B",
    diffBlue = "#252535",
    gitGreen = "#76946A",
    gitRed = "#C34043",
    gitYellow = "#DCA561",

    -- Main Colors
    red = "#C34043",
    red2 = "#E46876",
    red3 = "#c4746e",
    yellow = "#DCA561",
    yellow2 = "#E6C384",
    yellow3 = "#c4b28a",
    green = "#98BB6C",
    green2 = "#87a987",
    green3 = "#8a9a7b",
    green4 = "#6A9589",
    green5 = "#7AA89F",
    blue = "#7FB4CA",
    blue2 = "#658594",
    blue3 = "#8ba4b0",
    blue4 = "#8ea4a2",
    violet = "#938AA9",
    violet2 = "#8992a7",
    violet3 = "#949fb5",
    pink = "#a292a3",
    orange = "#b6927b",
    orange2 = "#b98d7b",
    aqua = "#8ea4a2",

    -- Saturated variants (20% more saturation)
    redSaturated = "#C93134",
    red2Saturated = "#ED5965",
    red3Saturated = "#CA675F",
    yellowSaturated = "#E59F49",
    yellow2Saturated = "#EDC272",
    yellow3Saturated = "#CAAC7A",
    greenSaturated = "#8FC055",
    green2Saturated = "#7CAF7C",
    green3Saturated = "#7F9F6E",
    green4Saturated = "#5B9A82",
    green5Saturated = "#6BAE97",
    blueSaturated = "#6EBBD4",
    blue2Saturated = "#568B8F",
    blue3Saturated = "#7EAABA",
    blue4Saturated = "#81AAA9",
    violetSaturated = "#8A88B0",
    violet2Saturated = "#7E91AF",
    violet3Saturated = "#8A9FBE",
    pinkSaturated = "#A08AA2",
    orangeSaturated = "#BC8A6C",
    orange2Saturated = "#BF856B",
    aquaSaturated = "#81AAA9",

    -- Fg and Comments
    fg = "#C5C9C7",
    fg2 = "#f2f1ef",
    gray = "#717C7C",
    gray2 = "#A4A7A4",
    gray3 = "#909398",
    gray4 = "#75797f",
    gray5 = "#5C6066",

    -- Light theme colors (pearl prefix)
    pearlBlack0 = "#22262D",
    pearlBlack1 = "#545464",
    pearlBlack2 = "#43436c",
    pearlGray = "#e2e1df",
    pearlGray2 = "#5C6068",
    pearlGray3 = "#6D6D69",
    pearlGray4 = "#9F9F99",

    pearlWhite0 = "#f2f1ef",
    pearlWhite1 = "#e2e1df",
    pearlWhite2 = "#dddddb",
    pearlWhite3 = "#cacac7",
    pearlViolet1 = "#a09cac",
    pearlViolet2 = "#766b90",
    pearlViolet3 = "#c9cbd1",
    pearlViolet4 = "#624c83",
    pearlBlue1 = "#c7d7e0",
    pearlBlue2 = "#b5cbd2",
    pearlBlue3 = "#9fb5c9",
    pearlBlue4 = "#4d699b",
    pearlBlue5 = "#5d57a3",
    pearlGreen = "#6f894e",
    pearlGreen2 = "#6e915f",
    pearlGreen3 = "#b7d0ae",
    pearlPink = "#b35b79",
    pearlOrange = "#cc6d00",
    pearlOrange2 = "#e98a00",
    pearlYellow = "#77713f",
    pearlYellow2 = "#836f4a",
    pearlYellow3 = "#de9800",
    pearlYellow4 = "#f9d791",
    pearlRed = "#c84053",
    pearlRed2 = "#d7474b",
    pearlRed3 = "#e82424",
    pearlRed4 = "#d9a594",
    pearlAqua = "#597b75",
    pearlAqua2 = "#5e857a",
    pearlTeal1 = "#4e8ca2",
    pearlTeal2 = "#6693bf",
    pearlTeal3 = "#5a7785",
    pearlCyan = "#d7e3d8",

    -- Pearl saturated variants (40% more saturation)
    pearlGreenSaturated = "#5E8F2F",
    pearlGreen2Saturated = "#5B9945",
    pearlGreen3Saturated = "#A8DA9B",
    pearlPinkSaturated = "#C04062",
    pearlOrangeSaturated = "#E05700",
    pearlOrange2Saturated = "#FF7700",
    pearlYellowSaturated = "#656720",
    pearlYellow2Saturated = "#72612B",
    pearlYellow3Saturated = "#F28C00",
    pearlYellow4Saturated = "#FFD56D",
    pearlRedSaturated = "#D72436",
    pearlRed2Saturated = "#E42D2C",
    pearlRed3Saturated = "#F50000",
    pearlRed4Saturated = "#E4977B",
    pearlAquaSaturated = "#3E8366",
    pearlAqua2Saturated = "#428F6A",
    pearlTeal1Saturated = "#2E96B0",
    pearlTeal2Saturated = "#469FD3",
    pearlTeal3Saturated = "#3D8077",
    pearlBlue4Saturated = "#2A73B1",
    pearlBlue5Saturated = "#3E56B8",
    pearlViolet4Saturated = "#44418F",
}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to KansoConfig.colors.
---   - theme: Use selected theme. Defaults to KansoConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string, foreground?: "default"|"saturated" }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local kanso = require("kanso")
    local override_colors = opts.colors or kanso.config.colors
    local theme = opts.theme or kanso._CURRENT_THEME
    
    -- Fallback: if _CURRENT_THEME is not set yet, try to determine theme from config
    if not theme then
        theme = kanso.config.background[vim.o.background] or kanso.config.theme or "ink"
        -- Store it for future use
        kanso._CURRENT_THEME = theme
    end

    if not theme then
        error(
            "kanso.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme kanso'"
        )
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local kanso_config = require("kanso").config
    local bg_mode = vim.o.background
    local foreground = opts.foreground
        or (type(kanso_config.foreground) == "table" and kanso_config.foreground[bg_mode])
        or kanso_config.foreground
        or "default"
    ---@cast foreground "default"|"saturated"
    local theme_colors = require("kanso.themes")[theme](updated_palette_colors, foreground)

    -- Add to and/or override theme_colors
    local theme_overrides =
        vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {})
    local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
    -- return palette_colors AND theme_colors

    return {
        theme = updated_theme_colors,
        palette = updated_palette_colors,
    }
end

return M
