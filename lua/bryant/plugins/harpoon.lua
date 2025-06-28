return {
	'ThePrimeagen/harpoon',
	branch = 'harpoon2',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		local harpoon2 = require('harpoon')
		local harpoon2_list = harpoon2:list()

    -- stylua: ignore start
		return {
      { "<c-h>", function() harpoon2_list:next({ ui_nav_wrap = true }) end, desc = 'Harpoon next' },
      { "<c-l>", function() harpoon2_list:prev({ ui_nav_wrap = true }) end, desc = 'Harpoon previous' },
      { '<c-e>', function() harpoon2.ui:toggle_quick_menu(harpoon2:list()) end, desc = 'Harpoon quick menu' },
      { '<c-y>', function() harpoon2_list:add() vim.notify('harpoon file added', vim.log.levels.INFO) end, desc = 'Harpoon add file' },
		}
	end,
}
