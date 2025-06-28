return {
	'mason-org/mason.nvim',
	dependencies = 'WhoIsSethDaniel/mason-tool-installer.nvim',
	branch = 'main',
	cmd = 'Mason',
	config = function()
		local ensure_installed = {
			-- lua
			'stylua',
			'luacheck',

			-- web dev
			'prettierd',
			'prettier',

			-- bash
			'shfmt',
			'shellcheck',
			'shellharden',

			-- golang
			'gofumpt',
			'goimports',
			'golangci-lint',

			-- python
			'ruff',

			-- markdown
			'alex',
			'markdownlint',

			-- javascript
			'eslint_d',

			-- toml
			'taplo',
		}
		require('mason').setup({
			ui = {
				border = 'single',
			},
		})
		require('mason-tool-installer').setup({
			ensure_installed = ensure_installed,
		})
	end,
}
