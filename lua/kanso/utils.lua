local M = {}
local PATH_SEP = vim.uv.os_uname().version:match("Windows") and "\\" or "/"

local get_compiled_path = function(theme)
    return table.concat({ vim.fn.stdpath("state"), "kanso", theme .. "_compiled.lua" }, PATH_SEP)
end

---@return string theme
function M.get_theme_from_bg_opt()
    local config = require("kanso").config
    return config.background[vim.o.background] or config.theme
end

---@param theme string
---@param highlights table
---@param termcolors table
function M.compile(theme, highlights, termcolors)
    vim.uv.fs_mkdir(vim.fn.stdpath("state") .. PATH_SEP .. "kanso", 448)

    local fname = get_compiled_path(theme)
    local file, err = io.open(fname, "wb")
    if not file or err then
        vim.notify("Kanso: Error writing " .. fname .. ":\n" .. err, vim.log.levels.ERROR)
        return
    end

    local lines = {
        "require'kanso'.compiled = string.dump(function()",
        "local g = vim.g",
        "local nvim_set_hl = vim.api.nvim_set_hl",
    }
    local inspect = vim.inspect
    for hl, spec in pairs(highlights) do
        if next(spec) then
            table.insert(lines, ('nvim_set_hl(0, "%s", %s)'):format(hl, inspect(spec):gsub("%s", "")))
        end
        for i, tcolor in ipairs(termcolors) do
            table.insert(lines, ('g["terminal_color_%d"] = "%s"'):format(i - 1, tcolor))
        end
    end
    table.insert(lines, "end)")

    local blob = table.concat(lines, "\n")
    assert(loadstring(blob, "=(compile)"))()
    file:write(require("kanso").compiled)
    file:close()
end

---@param theme string
---@return boolean status
function M.load_compiled(theme)
    local f = loadfile(get_compiled_path(theme))
    if f then
        f()
        return true
    end
    return false
end

return M
