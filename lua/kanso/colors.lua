---@class PaletteColors
local palette = {

    -- Bg Shades
    zen0 = "#090E13",
    zen1 = "#1C1E25",
    zen2 = "#22262D",
    zen3 = "#393B44",

    -- Popup and Floats
    zenBlue1 = "#223249",
    zenBlue2 = "#2D4F67",

    -- Diff and Git
    winterGreen = "#2B3328",
    winterYellow = "#49443C",
    winterRed = "#43242B",
    winterBlue = "#252535",
    autumnGreen = "#76946A",
    autumnRed = "#C34043",
    autumnYellow = "#DCA561",

    -- Diag
    samuraiRed = "#C34043",
    roninYellow = "#DCA561",
    zenAqua1 = "#6A9589",
    inkBlue = "#658594",

    -- Fg and Comments
    oldWhite = "#C5C9C7",
    fujiWhite = "#f2f1ef",

    springViolet1 = "#938AA9",
    springBlue = "#7FB4CA",
    zenAqua2 = "#7AA89F",

    springGreen = "#98BB6C",
    carpYellow = "#E6C384",

    zenRed = "#E46876",
    katanaGray = "#717C7C",

    inkBlack0 = "#14171d",
    inkBlack1 = "#1f1f26",
    inkBlack2 = "#22262D",
    inkBlack3 = "#393B44",
    inkBlack4 = "#4b4e57",

    inkWhite = "#C5C9C7",
    inkGreen = "#87a987",
    inkGreen2 = "#8a9a7b",
    inkPink = "#a292a3",
    inkOrange = "#b6927b",
    inkOrange2 = "#b98d7b",
    inkGray = "#A4A7A4",
    inkGray1 = "#909398",
    inkGray2 = "#75797f",
    inkGray3 = "#5C6066",
    inkBlue2 = "#8ba4b0",
    inkViolet = "#8992a7",
    inkRed = "#c4746e",
    inkAqua = "#8ea4a2",
    inkAsh = "#5C6066",
    inkTeal = "#949fb5",
    inkYellow = "#c4b28a", --"#a99c8b",
    -- "#8a9aa3",

    -- Mist Shades
    mist0 = "#22262D",
    mist1 = "#2a2c35",
    mist2 = "#393B44",
    mist3 = "#5C6066",

    mistWhite = "#C5C9C7",
    mistGreen = "#87a987",
    mistGreen2 = "#8a9a7b",
    mistPink = "#a292a3",
    mistOrange = "#b6927b",
    mistOrange2 = "#b98d7b",
    mistGray = "#A4A7A4",
    mistGray1 = "#909398",
    mistGray2 = "#75797f",
    mistGray3 = "#5C6066",
    mistBlue2 = "#8ba4b0",
    mistViolet = "#8992a7",
    mistRed = "#c4746e",
    mistAqua = "#8ea4a2",
    mistAsh = "#5C6066",
    mistTeal = "#949fb5",
    mistYellow = "#c4b28a",

    pearlInk0 = "#22262D",
    pearlInk1 = "#545464",
    pearlInk2 = "#43436c",
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
}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to KansoConfig.colors.
---   - theme: Use selected theme. Defaults to KansoConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
    opts = opts or {}
    local override_colors = opts.colors or require("kanso").config.colors
    local theme = opts.theme or require("kanso")._CURRENT_THEME -- WARN: this fails if called before kanso.load()

    if not theme then
        error(
            "kanso.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme kanso'"
        )
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("kanso.themes")[theme](updated_palette_colors)

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
