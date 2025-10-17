--TODO:
--PreProc needs its own color
--parameter and field should be different
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec
---@field untracked ColorSpec

---@class UiElements
---@field none ColorSpec
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec
---@field bg_dim ColorSpec Dimmed background
---@field bg_m3 ColorSpec
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field special ColorSpec SpecialKey
---@field indent_line ColorSpec IndentLine
---@field active_indent_line ColorSpec IndentLine
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field cursor_line_nr_foreground ColorSpec
---@field cursor_line_nr_active_foreground ColorSpec
---@field cursor_bg ColorSpec
---@field cursor_fg ColorSpec
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

return {
    ---@param palette PaletteColors
    ---@param foreground? "default"|"saturated"
    ---@return ThemeColors
    zen = function(palette, foreground)
        return {
            ui = {
                none = "NONE",
                fg = palette.fg,
                fg_dim = palette.gray2,
                fg_reverse = palette.altBlue1,

                bg_dim = palette.zenBg0,

                bg_m3 = palette.zenBg0,
                bg_m2 = palette.zenBg0,
                bg_m1 = palette.zenBg0,
                bg = palette.zenBg0,
                bg_p1 = palette.zenBg1,
                bg_p2 = palette.zenBg2,

                special = palette.gray5,
                indent_line = palette.inkBg2,
                active_indent_line = palette.inkBg3,
                whitespace = palette.inkBg3,
                nontext = palette.gray5,

                bg_visual = palette.inkBg3,
                bg_search = palette.altBlue2,

                cursor_line_nr_foreground = palette.gray5,
                cursor_line_nr_active_foreground = palette.fg2,
                cursor_bg = palette.fg2,
                cursor_fg = palette.zenBg0,

                pmenu = {
                    fg = palette.fg2,
                    fg_sel = "NONE",
                    bg = palette.zenBg0,
                    bg_sel = palette.inkBg3,
                    bg_thumb = palette.inkBg3,
                    bg_sbar = palette.zenBg0,
                },

                float = {
                    fg = palette.gray2,
                    bg = palette.zenBg0,
                    fg_border = palette.zenBg2,
                    bg_border = palette.zenBg0,
                },
            },
            syn = {
                string = foreground == "saturated" and palette.green3Saturated or palette.green3,
                variable = "NONE",
                number = foreground == "saturated" and palette.pinkSaturated or palette.pink,
                constant = foreground == "saturated" and palette.orangeSaturated or palette.orange,
                identifier = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                parameter = palette.gray3,
                fun = foreground == "saturated" and palette.blue3Saturated or palette.blue3,
                statement = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                keyword = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                operator = palette.gray3,
                preproc = palette.gray3,
                type = foreground == "saturated" and palette.aquaSaturated or palette.aqua,
                regex = foreground == "saturated" and palette.red3Saturated or palette.red3,
                deprecated = palette.gray,
                punct = palette.gray3,
                comment = palette.gray4,
                special1 = foreground == "saturated" and palette.yellow3Saturated or palette.yellow3,
                special2 = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                special3 = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
            },
            diag = {
                error = palette.red,
                ok = palette.green,
                warning = palette.yellow,
                info = palette.blue2,
                hint = palette.green4,
            },
            diff = {
                add = palette.diffGreen,
                delete = palette.diffRed,
                change = palette.diffBlue,
                text = palette.diffYellow,
            },
            vcs = {
                added = palette.gitGreen,
                removed = palette.gitRed,
                changed = palette.gitYellow,
                untracked = palette.gray4,
            },
            term = {
                palette.zenBg0, -- black
                palette.red3, -- red
                palette.green3, -- green
                palette.yellow3, -- yellow
                palette.blue3, -- blue
                palette.pink, -- magenta
                palette.fg, -- cyan
                palette.gray2, -- white
                palette.gray3, -- bright black
                palette.red2, -- bright red
                palette.green2, -- bright green
                palette.yellow2, -- bright yellow
                palette.blue, -- bright blue
                palette.violet, -- bright magenta
                palette.green5, -- bright cyan
                palette.fg, -- bright white
                palette.orange, -- extended color 1
                palette.orange2, -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@param foreground? "default"|"saturated"
    ---@return ThemeColors
    ink = function(palette, foreground)
        return {
            ui = {
                none = "NONE",
                fg = palette.fg,
                fg_dim = palette.gray2,
                fg_reverse = palette.altBlue1,

                bg_dim = palette.inkBg0,

                bg_m3 = palette.inkBg0,
                bg_m2 = palette.inkBg0,
                bg_m1 = palette.inkBg0,
                bg = palette.inkBg0,
                bg_p1 = palette.inkBg1,
                bg_p2 = palette.inkBg2,

                special = palette.gray5,
                indent_line = palette.inkBg2,
                active_indent_line = palette.inkBg3,
                whitespace = palette.inkBg4,
                nontext = palette.gray5,

                bg_visual = palette.inkBg3,
                bg_search = palette.altBlue2,

                cursor_line_nr_foreground = palette.gray5,
                cursor_line_nr_active_foreground = palette.fg2,
                cursor_bg = palette.fg2,
                cursor_fg = palette.inkBg0,

                pmenu = {
                    fg = palette.fg2,
                    fg_sel = "NONE",
                    bg = palette.inkBg0,
                    bg_sel = palette.inkBg3,
                    bg_thumb = palette.inkBg3,
                    bg_sbar = palette.inkBg0,
                },

                float = {
                    fg = palette.gray2,
                    bg = palette.inkBg0,
                    fg_border = palette.inkBg2,
                    bg_border = palette.inkBg0,
                },
            },
            syn = {
                string = foreground == "saturated" and palette.green3Saturated or palette.green3,
                variable = "NONE",
                number = foreground == "saturated" and palette.pinkSaturated or palette.pink,
                constant = foreground == "saturated" and palette.orangeSaturated or palette.orange,
                identifier = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                parameter = palette.gray3,
                fun = foreground == "saturated" and palette.blue3Saturated or palette.blue3,
                statement = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                keyword = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                operator = palette.gray3,
                preproc = palette.gray3,
                type = foreground == "saturated" and palette.aquaSaturated or palette.aqua,
                regex = foreground == "saturated" and palette.red3Saturated or palette.red3,
                deprecated = palette.gray,
                punct = palette.gray3,
                comment = palette.gray4,
                special1 = foreground == "saturated" and palette.yellow3Saturated or palette.yellow3,
                special2 = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                special3 = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
            },
            diag = {
                error = palette.red,
                ok = palette.green,
                warning = palette.yellow,
                info = palette.blue2,
                hint = palette.green4,
            },
            diff = {
                add = palette.diffGreen,
                delete = palette.diffRed,
                change = palette.diffBlue,
                text = palette.diffYellow,
            },
            vcs = {
                added = palette.gitGreen,
                removed = palette.gitRed,
                changed = palette.gitYellow,
                untracked = palette.gray4,
            },
            term = {
                palette.inkBg0, -- black
                palette.red3, -- red
                palette.green3, -- green
                palette.yellow3, -- yellow
                palette.blue3, -- blue
                palette.pink, -- magenta
                palette.fg, -- cyan
                palette.gray2, -- white
                palette.gray3, -- bright black
                palette.red2, -- bright red
                palette.green2, -- bright green
                palette.yellow2, -- bright yellow
                palette.blue, -- bright blue
                palette.violet, -- bright magenta
                palette.green5, -- bright cyan
                palette.fg, -- bright white
                palette.orange, -- extended color 1
                palette.orange2, -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@param foreground? "default"|"saturated"
    ---@return ThemeColors
    pearl = function(palette, foreground)
        return {
            ui = {
                none = "NONE",
                fg = palette.pearlBlack0,
                fg_dim = palette.pearlBlack1,
                fg_reverse = palette.pearlGray,

                bg_dim = palette.pearlWhite0,

                bg_m3 = palette.pearlWhite0,
                bg_m2 = palette.pearlWhite0,
                bg_m1 = palette.pearlWhite0,
                bg = palette.pearlWhite0,
                bg_p1 = palette.pearlWhite1,
                bg_p2 = palette.pearlWhite1,

                nontext = palette.pearlViolet1,
                whitespace = palette.pearlWhite3,
                special = palette.pearlViolet2,
                indent_line = palette.pearlWhite2,
                active_indent_line = palette.pearlWhite2,

                bg_visual = palette.pearlWhite2,
                bg_search = palette.pearlBlue2,

                cursor_line_nr_foreground = palette.pearlGray4,
                cursor_line_nr_active_foreground = palette.inkBg2,
                cursor_bg = palette.pearlBlack0,
                cursor_fg = palette.pearlWhite0,

                pmenu = {
                    fg = palette.pearlBlack2,
                    fg_sel = "NONE", -- This is important to make highlights pass-through
                    bg = palette.pearlWhite0,
                    bg_sel = palette.pearlWhite2,
                    bg_thumb = palette.pearlWhite2,
                    bg_sbar = palette.pearlWhite0,
                },
                float = {
                    fg = palette.pearlBlack2,
                    bg = palette.pearlWhite0,
                    fg_border = palette.pearlWhite2,
                    bg_border = palette.pearlWhite0,
                },
            },
            syn = {
                string = foreground == "saturated" and palette.pearlGreenSaturated or palette.pearlGreen,
                variable = "NONE",
                number = foreground == "saturated" and palette.pearlPinkSaturated or palette.pearlPink,
                constant = foreground == "saturated" and palette.pearlOrangeSaturated or palette.pearlOrange,
                identifier = foreground == "saturated" and palette.pearlViolet4Saturated or palette.pearlViolet4,
                parameter = foreground == "saturated" and palette.pearlBlue5Saturated or palette.pearlBlue5,
                fun = foreground == "saturated" and palette.pearlBlue4Saturated or palette.pearlBlue4,
                statement = foreground == "saturated" and palette.pearlViolet4Saturated or palette.pearlViolet4,
                keyword = foreground == "saturated" and palette.pearlViolet4Saturated or palette.pearlViolet4,
                operator = palette.pearlGray3,
                preproc = palette.pearlGray2,
                type = foreground == "saturated" and palette.pearlAquaSaturated or palette.pearlAqua,
                regex = foreground == "saturated" and palette.pearlYellow2Saturated or palette.pearlYellow2,
                deprecated = palette.pearlGray3,
                comment = palette.pearlGray3,
                punct = palette.pearlGray3,
                special1 = foreground == "saturated" and palette.pearlYellow2Saturated or palette.pearlYellow2,
                special2 = foreground == "saturated" and palette.pearlViolet4Saturated or palette.pearlViolet4,
                special3 = foreground == "saturated" and palette.pearlViolet4Saturated or palette.pearlViolet4,
            },
            vcs = {
                added = palette.pearlGreen2,
                removed = palette.pearlRed2,
                changed = palette.pearlYellow3,
                untracked = palette.pearlGray4,
            },
            diff = {
                add = palette.pearlGreen3,
                delete = palette.pearlRed4,
                change = palette.pearlCyan,
                text = palette.pearlYellow4,
            },
            diag = {
                error = palette.pearlRed3,
                ok = palette.pearlGreen,
                warning = palette.pearlOrange2,
                info = palette.pearlTeal3,
                hint = palette.pearlAqua2,
            },
            term = {
                palette.inkBg2, -- black
                palette.pearlRed, -- red
                palette.pearlGreen, -- green
                palette.pearlYellow, -- yellow
                palette.pearlBlue4, -- blue
                palette.pearlPink, -- magenta
                palette.pearlAqua, -- cyan
                palette.pearlBlack0, -- white
                palette.pearlGray3, -- bright black
                palette.pearlRed2, -- bright red
                palette.pearlGreen2, -- bright green
                palette.pearlYellow2, -- bright yellow
                palette.pearlTeal2, -- bright blue
                palette.pearlViolet4, -- bright magenta
                palette.pearlAqua2, -- bright cyan
                palette.pearlBlack2, -- bright white
                palette.pearlOrange2, -- extended color 1
                palette.pearlRed3, -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@param foreground? "default"|"saturated"
    ---@return ThemeColors
    mist = function(palette, foreground)
        return {
            ui = {
                none = "NONE",
                fg = palette.fg,
                fg_dim = palette.gray2,
                fg_reverse = palette.altBlue1,

                bg_dim = palette.mistBg0,

                bg_m3 = palette.mistBg0,
                bg_m2 = palette.mistBg0,
                bg_m1 = palette.mistBg0,
                bg = palette.mistBg0,
                bg_p1 = palette.mistBg2,
                bg_p2 = palette.mistBg2,

                special = palette.gray5,
                indent_line = palette.mistBg2,
                active_indent_line = palette.mistBg3,
                whitespace = palette.mistBg3,
                nontext = palette.gray5,

                bg_visual = palette.mistBg2,
                bg_search = palette.altBlue2,

                cursor_line_nr_foreground = palette.gray4,
                cursor_line_nr_active_foreground = palette.fg2,
                cursor_bg = palette.fg2,
                cursor_fg = palette.mistBg0,

                pmenu = {
                    fg = palette.fg2,
                    fg_sel = "NONE",
                    bg = palette.mistBg0,
                    bg_sel = palette.mistBg2,
                    bg_thumb = palette.mistBg2,
                    bg_sbar = palette.mistBg0,
                },

                float = {
                    fg = palette.gray2,
                    bg = palette.mistBg0,
                    fg_border = palette.mistBg2,
                    bg_border = palette.mistBg0,
                },
            },
            syn = {
                string = foreground == "saturated" and palette.green3Saturated or palette.green3,
                variable = "NONE",
                number = foreground == "saturated" and palette.pinkSaturated or palette.pink,
                constant = foreground == "saturated" and palette.orangeSaturated or palette.orange,
                identifier = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                parameter = palette.gray3,
                fun = foreground == "saturated" and palette.blue3Saturated or palette.blue3,
                statement = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                keyword = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                operator = palette.gray3,
                preproc = palette.gray3,
                type = foreground == "saturated" and palette.aquaSaturated or palette.aqua,
                regex = foreground == "saturated" and palette.red3Saturated or palette.red3,
                deprecated = palette.gray,
                punct = palette.gray3,
                comment = palette.gray4,
                special1 = foreground == "saturated" and palette.yellow3Saturated or palette.yellow3,
                special2 = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
                special3 = foreground == "saturated" and palette.violet2Saturated or palette.violet2,
            },
            diag = {
                error = palette.red,
                ok = palette.green,
                warning = palette.yellow,
                info = palette.blue2,
                hint = palette.green4,
            },
            diff = {
                add = palette.diffGreen,
                delete = palette.diffRed,
                change = palette.diffBlue,
                text = palette.diffYellow,
            },
            vcs = {
                added = palette.gitGreen,
                removed = palette.gitRed,
                changed = palette.gitYellow,
                untracked = palette.gray4,
            },
            term = {
                palette.mistBg0, -- black
                palette.red3, -- red
                palette.green3, -- green
                palette.yellow3, -- yellow
                palette.blue3, -- blue
                palette.pink, -- magenta
                palette.fg, -- cyan
                palette.gray2, -- white
                palette.gray3, -- bright black
                palette.red2, -- bright red
                palette.green2, -- bright green
                palette.yellow2, -- bright yellow
                palette.blue, -- bright blue
                palette.violet, -- bright magenta
                palette.green5, -- bright cyan
                palette.fg, -- bright white
                palette.orange, -- extended color 1
                palette.orange2, -- extended color 2
            },
        }
    end,
}
