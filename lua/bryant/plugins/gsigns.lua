return {
	'lewis6991/gitsigns.nvim',
	opts = {
		signcolumn = false,
		signs = {
			add = { text = '┃' },
			change = { text = '┃' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
			untracked = { text = '┆' },
		},
	},
	keys = {
		{
			']g',
			function()
				if vim.wo.diff then
					return ']g'
				end
				vim.schedule(function()
					require('gitsigns').nav_hunk('next')
				end)
			end,
			{ expr = true, desc = 'Go to the next hunk' },
		},
		{
			'[g',
			function()
				if vim.wo.diff then
					return '[g'
				end
				vim.schedule(function()
					require('gitsigns').nav_hunk('prev')
				end)
			end,
			{ expr = true, desc = 'Go to the previous hunk' },
		},

		-- stylua: ignore start
		{ '<leader>gr', function() require('gitsigns').reset_hunk() end,    { desc = 'Gitsigns Reset Hunk' } },
		{ '<leader>gb', function() require('gitsigns').blame_line() end,   { desc = 'Gitsigns Blame Line' } },
		{ '<leader>gg', function() require('gitsigns').toggle_signs() end,   { desc = 'Gitsigns Toggle Signs' } },
		{ '<leader>gp', function() require('gitsigns').preview_hunk() end,   { desc = 'Gitsigns Preview Hunk' } },
		{ '<leader>gl', function() require('gitsigns').toggle_linehl() end,  { desc = 'Gitsigns Toggle linehl' } },
		-- stylua: ignore end
	},
}
