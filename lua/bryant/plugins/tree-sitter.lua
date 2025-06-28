return {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufEnter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup({
			matchup = {
				enable = true,
			},
			ensure_installed = {
				'c',
				'lua',
				'bash',
				'vimdoc',
				'markdown',
				'markdown_inline',
			},
			auto_install = true,
			incremental_selection = {
				enable = false,
			},
			indent = { enable = true },
			highlight = {
				enable = true,
				disable = function(lang, buf)
					if lang == 'html' then
						vim.notify('treesitter disabled in html', vim.log.levels.INFO, {
							title = 'Treesitter',
						})
						return true
					end

					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						vim.notify(
							'File larger than 100KB treesitter disabled for performance',
							vim.log.levels.WARN,
							{ title = 'Treesitter' }
						)
						return true
					end
				end,
				additional_vim_regex_highlighting = { 'markdown' },
			},
		})
	end,
}
