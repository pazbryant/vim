return {
	'folke/flash.nvim',
	lazy = 'VeryLazy',
	opts = {
		search = {
			multi_window = false,
		},
		label = {
			style = 'overlay', ---@type "eol" | "overlay" | "right_align" | "inline"

			rainbow = {
				enabled = true,
				-- number between 1 and 9
				shade = 9,
			},
		},
		jump = {
			autojump = true,
		},
		highlight = {
			backdrop = true,
			matches = false,
			priority = 5000,
		},
		modes = {
			char = {
				enabled = true,
				jump_labels = true,
				multi_line = true,
				keys = { 'f', 'F', 't', 'T', [';'] = ':', ',' },
				char_actions = function(motion)
					return {
						[';'] = 'next', -- set to `right` to always go right
						[','] = 'prev', -- set to `left` to always go left
						-- clever-f style
						[motion:lower()] = 'next',
						[motion:upper()] = 'prev',
					}
				end,
				highlight = { backdrop = true },
			},
			treesitter = {
				jump = { pos = 'range', autojump = true },
				highlight = {
					backdrop = true,
					matches = false,
				},
			},
		},
	},
	keys = function()
		local flash = require('flash')
		return {
			{
				's',
				mode = { 'n', 'x', 'o' },
				function()
					flash.jump()
				end,
				desc = 'Flash',
			},
			{
				'gs', -- ; and , increase and decrease
				mode = { 'n', 'x', 'o' },
				function()
					flash.treesitter()
				end,
				desc = 'Flash Treesitter',
			},
			{
				'r',
				mode = 'o',
				function()
					flash.remote()
				end,
				desc = 'Remote Flash',
			},
		}
	end,
}
