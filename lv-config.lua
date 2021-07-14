-- Settings
O.leader_key = ' '
O.colorscheme = 'lunar'
O.colorcolumn = '80,120'
O.format_on_save = true
O.auto_complete = true
O.auto_close_tree = 1
O.wrap_lines = false
O.timeoutlen = 100
O.document_highlight = true
O.ignore_case = true
O.smart_case = true

-- python
-- add things like O.python.formatter.yapf.exec_path
-- add things like O.python.linter.flake8.exec_path
-- add things like O.python.formatter.isort.exec_path
O.lang.python.formatter = 'black'
O.lang.python.isort = true
O.lang.python.diagnostics.virtual_text = true
O.lang.python.diagnostics.signs = true
O.lang.python.diagnostics.underline = true
O.lang.python.analysis.type_checking = "oon"
O.lang.python.analysis.auto_search_paths = true
O.lang.python.analysis.use_library_code_types = true

-- Lua
O.lang.lua.formatter = 'lua-format'

-- JS/TS
O.lang.tsserver.formatter = 'prettier'
O.lang.tsserver.linter = 'eslint'

-- Plugins
O.plugin.dashboard.active = true
O.plugin.floatterm.active = true
O.plugin.zen.active = true
O.plugin.colorizer.active = true
O.plugin.indent_line.active = true
O.plugin.ts_context_commentstring.active = true
O.plugin.symbol_outline.active = true
O.plugin.trouble.active = true
O.plugin.debug.active = true
O.plugin.telescope_fzy.active = true
O.plugin.telescope_project.active = true
O.plugin.sanegx.active = true
O.plugin.diffview.active = true
O.plugin.ts_rainbow.active = true
O.plugin.ts_autotag.active = true
O.plugin.ts_textobjects.active = false
O.plugin.ts_textsubjects.active = true
O.plugin.ts_hintobjects.active = true

O.user_plugins = {
    {
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
    }, {
        'romgrk/nvim-treesitter-context',
        event = "BufRead"
        -- disable = not O.plugin.treesitter_context.active
    }, {
        "folke/todo-comments.nvim",
        config = function() require("todo-comments").setup {} end,
        event = "BufRead",
        disable = false
    }
}

O.user_which_key = {
    t = {
        name = "+terminal",
        t = {"<cmd>lua require('FTerm').toggle()<cr>", "Terminal"},
        T = {'<cmd>lcd %:p:h | :term<cr>', 'open terminal in this directory'}
    },
    g = {
        name = "Git",
        j = {"<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk"},
        k = {"<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk"},
        l = {"<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame"},
        p = {"<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk"},
        r = {"<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk"},
        R = {"<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer"},
        s = {"<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk"},
        u = {
            "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
            "Undo Stage Hunk"
        },
        o = {"<cmd>Telescope git_status<cr>", "Open changed file"},
        b = {"<cmd>Telescope git_branches<cr>", "Checkout branch"},
        c = {"<cmd>Telescope git_commits<cr>", "Checkout commit"},
        C = {
            "<cmd>Telescope git_bcommits<cr>",
            "Checkout commit(for current file)"
        },
        B = {"<cmd>GitBlameToggle<cr>", "Toggle Git Blame"}
    },
    l = {
        name = "LSP",
        a = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action"},
        d = {
            "<cmd>Telescope lsp_document_diagnostics<cr>",
            "Document Diagnostics"
        },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics"
        },
        f = {"<cmd>Neoformat<cr>", "Format"},
        i = {"<cmd>LspInfo<cr>", "Info"},
        j = {
            "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = O.lsp.popup_border}})<cr>",
            "Next Diagnostic"
        },
        k = {
            "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = O.lsp.popup_border}})<cr>",
            "Prev Diagnostic"
        },
        q = {"<cmd>Telescope quickfix<cr>", "Quickfix"},
        r = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"},
        s = {
            O.plugin.symbol_outline.active and "<cmd>SymbolsOutline<cr>" or
                "<cmd> Telescope lsp_document_symbols<cr>", "Document Symbols"
        },
        S = {
            "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
            "Workspace Symbols"
        },
        t = {
            "<cmd>TodoTelescope<cr>",
            "Search through all project todos with Telescope"
        }
    }

}
