local c = require("kanso.lib.color")

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
    ---@return ThemeColors
    zen = function(palette)
        return {
            ui = {
                fg                               = palette.inkWhite,
                fg_dim                           = palette.oldWhite,
                fg_reverse                       = palette.zenBlue1,

                bg_dim                           = palette.zen0,

                bg_m3                            = palette.zen0,
                bg_m2                            = palette.zen0,
                bg_m1                            = palette.zen0,
                bg                               = palette.zen0,
                bg_p1                            = palette.zen1,
                bg_p2                            = palette.zen2,

                special                          = palette.inkGray3,
                indent_line                      = palette.inkBlack2,
                active_indent_line               = palette.inkBlack3,
                whitespace                       = palette.inkBlack0,
                nontext                          = palette.inkAsh,

                bg_visual                        = palette.inkBlack2,
                bg_search                        = palette.zenBlue2,

                cursor_line_nr_foreground        = palette.inkGray3,
                cursor_line_nr_active_foreground = palette.fujiWhite,
                cursor_bg                        = palette.fujiWhite,
                cursor_fg                        = palette.zen0,

                pmenu                            = {
                    fg       = palette.fujiWhite,
                    fg_sel   = "NONE",
                    bg       = palette.zenBlue1,
                    bg_sel   = palette.zenBlue2,
                    bg_thumb = palette.zenBlue2,
                    bg_sbar  = palette.zenBlue1,
                },

                float                            = {
                    fg        = palette.oldWhite,
                    bg        = palette.zen0,
                    fg_border = palette.zen2,
                    bg_border = palette.zen0,
                },
            },
            syn = {
                string     = palette.inkGreen2,
                variable   = "NONE",
                number     = palette.inkPink,
                constant   = palette.inkOrange,
                identifier = palette.inkViolet,
                parameter  = palette.inkGray1,
                fun        = palette.inkBlue2,
                statement  = palette.inkViolet,
                keyword    = palette.inkViolet,
                operator   = palette.inkGray1,
                preproc    = palette.inkGray1,
                type       = palette.inkAqua,
                regex      = palette.inkRed,
                deprecated = palette.katanaGray,
                punct      = palette.inkGray1,
                comment    = palette.inkGray2,
                special1   = palette.inkYellow,
                special2   = palette.inkViolet,
                special3   = palette.inkViolet,
            },
            diag = {
                error   = palette.samuraiRed,
                ok      = palette.springGreen,
                warning = palette.roninYellow,
                info    = palette.inkBlue,
                hint    = palette.zenAqua1,
            },
            diff = {
                add    = palette.winterGreen,
                delete = palette.winterRed,
                change = palette.winterBlue,
                text   = palette.winterYellow,
            },
            vcs = {
                added     = palette.autumnGreen,
                removed   = palette.autumnRed,
                changed   = palette.autumnYellow,
                untracked = palette.inkGray2
            },
            term = {
                palette.zen0,          -- black
                palette.inkRed,        -- red
                palette.inkGreen2,     -- green
                palette.inkYellow,     -- yellow
                palette.inkBlue2,      -- blue
                palette.inkPink,       -- magenta
                palette.inkWhite,      -- cyan
                palette.oldWhite,      -- white
                palette.inkGray1,      -- bright black
                palette.zenRed,        -- bright red
                palette.inkGreen,      -- bright green
                palette.carpYellow,    -- bright yellow
                palette.springBlue,    -- bright blue
                palette.springViolet1, -- bright magenta
                palette.zenAqua2,      -- bright cyan
                palette.inkWhite,      -- bright white
                palette.inkOrange,     -- extended color 1
                palette.inkOrange2,    -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@return ThemeColors
    ink = function(palette)
        return {
            ui = {
                fg                               = palette.inkWhite,
                fg_dim                           = palette.oldWhite,
                fg_reverse                       = palette.zenBlue1,

                bg_dim                           = palette.inkBlack0,

                bg_m3                            = palette.inkBlack0,
                bg_m2                            = palette.inkBlack0,
                bg_m1                            = palette.inkBlack0,
                bg                               = palette.inkBlack0,
                bg_p1                            = palette.inkBlack1,
                bg_p2                            = palette.inkBlack2,

                special                          = palette.inkGray3,
                indent_line                      = palette.inkBlack2,
                active_indent_line               = palette.inkBlack3,
                whitespace                       = palette.inkBlack0,
                nontext                          = palette.inkAsh,

                bg_visual                        = palette.inkBlack3,
                bg_search                        = palette.zenBlue2,

                cursor_line_nr_foreground        = palette.inkGray3,
                cursor_line_nr_active_foreground = palette.fujiWhite,
                cursor_bg                        = palette.fujiWhite,
                cursor_fg                        = palette.inkBlack0,

                pmenu                            = {
                    fg       = palette.fujiWhite,
                    fg_sel   = "NONE",
                    bg       = palette.zenBlue1,
                    bg_sel   = palette.zenBlue2,
                    bg_thumb = palette.zenBlue2,
                    bg_sbar  = palette.zenBlue1,
                },

                float                            = {
                    fg        = palette.oldWhite,
                    bg        = palette.inkBlack0,
                    fg_border = palette.inkBlack2,
                    bg_border = palette.inkBlack0,
                },
            },
            syn = {
                string     = palette.inkGreen2,
                variable   = "NONE",
                number     = palette.inkPink,
                constant   = palette.inkOrange,
                identifier = palette.inkViolet,
                parameter  = palette.inkGray1,
                fun        = palette.inkBlue2,
                statement  = palette.inkViolet,
                keyword    = palette.inkViolet,
                operator   = palette.inkGray1,
                preproc    = palette.inkGray1,
                type       = palette.inkAqua,
                regex      = palette.inkRed,
                deprecated = palette.katanaGray,
                punct      = palette.inkGray1,
                comment    = palette.inkGray2,
                special1   = palette.inkYellow,
                special2   = palette.inkViolet,
                special3   = palette.inkViolet,
            },
            diag = {
                error   = palette.samuraiRed,
                ok      = palette.springGreen,
                warning = palette.roninYellow,
                info    = palette.inkBlue,
                hint    = palette.zenAqua1,
            },
            diff = {
                add    = palette.winterGreen,
                delete = palette.winterRed,
                change = palette.winterBlue,
                text   = palette.winterYellow,
            },
            vcs = {
                added     = palette.autumnGreen,
                removed   = palette.autumnRed,
                changed   = palette.autumnYellow,
                untracked = palette.inkGray2
            },
            term = {
                palette.inkBlack0,     -- black
                palette.inkRed,        -- red
                palette.inkGreen2,     -- green
                palette.inkYellow,     -- yellow
                palette.inkBlue2,      -- blue
                palette.inkPink,       -- magenta
                palette.inkWhite,      -- cyan
                palette.oldWhite,      -- white
                palette.inkGray1,      -- bright black
                palette.zenRed,        -- bright red
                palette.inkGreen,      -- bright green
                palette.carpYellow,    -- bright yellow
                palette.springBlue,    -- bright blue
                palette.springViolet1, -- bright magenta
                palette.zenAqua2,      -- bright cyan
                palette.inkWhite,      -- bright white
                palette.inkOrange,     -- extended color 1
                palette.inkOrange2,    -- extended color 2
            },
        }
    end,
    ---@param palette PaletteColors
    ---@return ThemeColors
    pearl = function(palette)
        return {
            ui = {
                fg                               = palette.pearlInk0,
                fg_dim                           = palette.pearlInk0,
                fg_reverse                       = palette.pearlGray,

                bg_dim                           = palette.pearlWhite0,

                bg_m3                            = palette.pearlWhite0,
                bg_m2                            = palette.pearlWhite0,
                bg_m1                            = palette.pearlWhite0,
                bg                               = palette.pearlWhite0,
                bg_p1                            = palette.pearlWhite1,
                bg_p2                            = palette.pearlWhite1,

                nontext                          = palette.pearlViolet1,
                whitespace                       = palette.pearlWhite0,
                special                          = palette.pearlViolet2,
                indent_line                      = palette.pearlWhite1,
                active_indent_line               = palette.pearlWhite2,

                bg_visual                        = palette.pearlWhite2,
                bg_search                        = palette.pearlBlue2,

                cursor_line_nr_foreground        = palette.pearlGray4,
                cursor_line_nr_active_foreground = palette.inkBlack2,
                cursor_bg                        = palette.fujiWhite,
                cursor_fg                        = palette.inkBlack2,

                pmenu                            = {
                    fg       = palette.pearlInk2,
                    fg_sel   = "NONE", -- This is important to make highlights pass-through
                    bg       = palette.pearlBlue1,
                    bg_sel   = palette.pearlBlue3,
                    bg_sbar  = palette.pearlBlue1,
                    bg_thumb = palette.pearlBlue2,
                },
                float                            = {
                    fg        = palette.pearlInk2,
                    bg        = palette.pearlWhite0,
                    fg_border = palette.pearlWhite2,
                    bg_border = palette.pearlWhite0,
                },
            },
            syn = {
                string     = palette.pearlGreen,
                variable   = "NONE",
                number     = palette.pearlPink,
                constant   = palette.pearlOrange,
                identifier = palette.pearlViolet4,
                parameter  = palette.pearlBlue5,
                fun        = palette.pearlBlue4,
                statement  = palette.pearlViolet4,
                keyword    = palette.pearlViolet4,
                operator   = palette.pearlGray3,
                preproc    = palette.pearlGray2,
                type       = palette.pearlAqua,
                regex      = palette.pearlYellow2,
                deprecated = palette.pearlGray3,
                comment    = palette.pearlGray3,
                punct      = palette.pearlGray3,
                special1   = palette.pearlYellow2,
                special2   = palette.pearlViolet4,
                special3   = palette.pearlViolet4,
            },
            vcs = {
                added     = palette.pearlGreen2,
                removed   = palette.pearlRed2,
                changed   = palette.pearlYellow3,
                untracked = palette.pearlGray4
            },
            diff = {
                add    = palette.pearlGreen3,
                delete = palette.pearlRed4,
                change = palette.pearlCyan,
                text   = palette.pearlYellow4,
            },
            diag = {
                error   = palette.pearlRed3,
                ok      = palette.pearlGreen,
                warning = palette.pearlOrange2,
                info    = palette.pearlTeal3,
                hint    = palette.pearlAqua2,
            },
            term = {
                palette.inkBlack2,    -- black
                palette.pearlRed,     -- red
                palette.pearlGreen,   -- green
                palette.pearlYellow,  -- yellow
                palette.pearlBlue4,   -- blue
                palette.pearlPink,    -- magenta
                palette.pearlAqua,    -- cyan
                palette.pearlInk0,    -- white
                palette.pearlGray3,   -- bright black
                palette.pearlRed2,    -- bright red
                palette.pearlGreen2,  -- bright green
                palette.pearlYellow2, -- bright yellow
                palette.pearlTeal2,   -- bright blue
                palette.pearlViolet4, -- bright magenta
                palette.pearlAqua2,   -- bright cyan
                palette.pearlInk2,    -- bright white
                palette.pearlOrange2, -- extended color 1
                palette.pearlRed3,    -- extended color 2
            },
        }
    end,
}
