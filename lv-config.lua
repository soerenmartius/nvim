-- Settings
O.leader_key = ' '
O.colorscheme = 'spacegray'
O.completion.autocomplete = true
O.format_on_save = true

O.auto_close_tree = 1
O.nvim_tree_disable_netrw = 1

O.default_options.relativenumber = true
O.default_options.timeoutlen = 100
O.default_options.colorcolumn = '80,120'

-- Plugins
O.plugin.dashboard.active = true
O.plugin.floatterm.active = true
O.plugin.zen.active = true
O.plugin.telescope.active = true

-- Treesitter
O.treesitter.ensure_installed = "all"
O.treesitter.ignore_install = {"haskell"}
O.treesitter.highlight.enabled = true
O.treesitter.context_commentstring.enabled = true
O.treesitter.autotag.enabled = true
O.treesitter.playground.enabled = true
O.treesitter.rainbow.enabled = true

-- Lua
O.lang.lua.formatter = 'lua-format'

-- Javascript/Typescript
O.lang.tsserver.formatter = 'prettier'
O.lang.tsserver.linter = 'eslint'
O.lang.tsserver.autoformat = true

-- Python
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.analysis.use_library_code_types = true

-- O.plugin.trouble.active = true
-- O.plugin.debug.active = true
-- O.plugin.sanegx.active = true
-- O.plugin.diffview.active = true

O.user_plugins = {
    {
      "b3nj5m1n/kommentary",
      cmd = "CommentToggle",
      config = function()
        require("lv-kommentary").config()
      end,
      event = "BufRead"
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "BufWinEnter",
        config = function() require "lv-colorizer" end,
        disable = false
    }, {
        "monaqa/dial.nvim",
        event = "BufRead",
        config = function() require("lv-dial").config() end,
        opt = true
    }, {
        "phaazon/hop.nvim",
        event = "BufRead",
        config = function() require("lv-hop").config() end,
        opt = true
    }, {"f-person/git-blame.nvim", event = "BufRead", disable = false}, {
        'ethanholz/nvim-lastplace',
        config = function() require('nvim-lastplace').setup() end,
        opt = false
    }, {
        'ruifm/gitlinker.nvim',
        event = "BufRead",
        config = function()
            require"gitlinker".setup({
                opts = {
                    -- remote = 'github', -- force the use of a specific remote
                    -- adds current line nr in the url for normal mode
                    add_current_line_on_normal_mode = true,
                    -- callback for what to do with the url
                    action_callback = require"gitlinker.actions".open_in_browser,
                    -- print the url after performing the action
                    print_url = false,
                    -- mapping to call url generation
                    mappings = "<leader>gy"
                }
            })

        end,
        requires = 'nvim-lua/plenary.nvim'
    }, {
        "andymass/vim-matchup",
        event = "CursorMoved",
        config = function() require("lv-matchup").config() end
    }, {
        "windwp/nvim-spectre",
        event = "BufRead",
        config = function() require("spectre").setup() end
    }, {
        "nacro90/numb.nvim",
        event = "BufRead",
        config = function()
            require("numb").setup {
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true -- Enable 'cursorline' for the window while peeking
            }
        end,
        disable = false
    }, {'romgrk/nvim-treesitter-context', event = "BufRead", disable = false},
    -- Pretty parentheses
    -- TODO: Will be replaced by lunarvim at some point
    {"p00f/nvim-ts-rainbow", disable = false}, {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            vim.g.indentLine_enabled = 1
            vim.g.indent_blankline_char = "▏"

            vim.g.indent_blankline_filetype_exclude =
                {"help", "terminal", "dashboard"}
            vim.g.indent_blankline_buftype_exclude = {"terminal"}
            vim.g.indent_blankline_show_trailing_blankline_indent = false
            vim.g.indent_blankline_show_first_indent_level = true
            vim.g.indent_blankline_space_char = ' '
            -- vim.g.indent_blankline_char_highlight_list = {"Error", "Function"}

        end,
        disable = false
    }, {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        setup = function()
            vim.g.symbols_outline = {
                highlight_hovered_item = true,
                show_guides = true,
                auto_preview = true,
                position = "right",
                keymaps = {
                    close = "<Esc>",
                    goto_location = "<Cr>",
                    focus_location = "o",
                    hover_symbol = "<C-space>",
                    rename_symbol = "r",
                    code_actions = "a"
                },
                lsp_blacklist = {}
            }
        end,
        disable = false
    }, {
        "folke/todo-comments.nvim",
        config = function() require("todo-comments").setup {} end,
        event = "BufRead",
        disable = false
    }
}

O.user_which_key = {
    S = {
        name = "+spectre",
        ["o"] = {":lua require('spectre').open()<CR>", "Open Spectre"},
        ["f"] = {":lua require('spectre').open()<CR>", "Search in current file"}
    },
    v = {
        name = "+split views",
        ["v"] = {"<C-W>v", "Split Vertically"},
        ["s"] = {"<C-W>s", "Split Horizontially"}
    },
    t = {
        name = "+terminal",
        t = {"<cmd>lua require('FTerm').toggle()<cr>", "Terminal"},
        T = {'<cmd>lcd %:p:h | :term<cr>', 'open terminal in this directory'}
    },
    s = {
        T = {
            "<cmd>TodoTelescope<cr>",
            "Search through all project todos with Telescope"
        }
    }
}
