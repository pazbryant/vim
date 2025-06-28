return {
	{
		'Mofiqul/vscode.nvim',
		config = function()
			require('vscode').setup({
				transparent = false,
				italic_comments = false,
			})
			vim.cmd.colorscheme('vscode')
		end,
	},

	{
		lazy = false,
		priority = 1000,
		'rose-pine/neovim',
		config = function()
			require('rose-pine').setup({
				styles = {
					bold = true,
					italic = false,
					transparency = false,
				},
			})
			vim.cmd.colorscheme('rose-pine-moon')
		end,
	},

	{
		'rebelot/kanagawa.nvim',
		config = function()
			require('kanagawa').setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
			})
			vim.cmd.colorscheme('kanagawa')
		end,
	},
}
