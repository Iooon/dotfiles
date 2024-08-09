local builtin = require('telescope.builtin')

return {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {'<leader>?', function() builtin.find_files() end,
            { desc = '[?] Find recently opened files' }
        },
        {'<leader><space>', function() builtin.buffers() end,
            { desc = '[ ] Find existing buffers' }
        },
        {'<leader>sf', function() builtin.find_files() end,
            { desc = '[S]earch [F]iles' }
        },
        {'<leader>sh', function() builtin.help_tags() end,
            { desc = '[S]earch [H]elp' }
        },
        {'<leader>sw', function() builtin.grep_string() end,
            { desc = '[S]earch current [W]ord' }
        },
        {'<leader>sg', function() builtin.live_grep() end,
            { desc = '[S]earch by [G]rep' }
        },
        {'<leader>sd', function() builtin.diagnostics() end,
            { desc = '[S]earch [D]iagnostics' }
        },
        {'<leader>sG', function() builtin.git_files() end,
            { desc = '[S]earch [G]it Files' }
        },
        {'<leader>/', function() builtin.current_buffer_fuzzy_find(
                require('telescope.themes').get_dropdown(
                    { winblend = 10, previewer = false, }
                )) end,
            { desc = '[/] Fuzzily search in current buffer]' }
        },
        {'<leader>f', function() builtin.grep_string(
                    { search = vim.fn.input("Grep >") }) end,
            { desc = '[f] Fuzzily search in files]' }
        },
    },
    opts = {
        defaults={mappings={i={
            ["<C-h>"] = "which_key",
            ["<C-j>"] = require('telescope.actions').move_selection_next,
            ["<C-k>"] = require('telescope.actions').move_selection_previous,
            ["<C-u>"] = false,
            ["<C-d>"] = false,
        }}}
    }
}
