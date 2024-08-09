local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {'<leader>a', function() mark.add_file() end,
            { desc = 'Harpoon Add File' }
        },
        {'<C-e>', function() ui.toggle_quick_menu() end,
            { desc = 'Harpoon Quick Menu' }
        },
        {'<leader>1', function() ui.nav_file(1) end},
        {'<leader>2', function() ui.nav_file(2) end},
        {'<leader>3', function() ui.nav_file(3) end},
        {'<leader>4', function() ui.nav_file(4) end},
    },
}
