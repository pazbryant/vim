return {
	'monaqa/dial.nvim',
	event = { 'BufReadPost', 'BufNewFile' },
	config = function()
		local augend = require('dial.augend')
		local dial_config = require('dial.config')

		dial_config.augends = dial_config.augends or {}

		local common_augends = {
			augend.integer.alias.decimal,
			augend.integer.alias.hex,
			augend.date.alias['%Y-%m-%d'],
			augend.date.alias['%m/%d/%Y'],
			augend.constant.alias.bool,
		}

		local language_configs = {
			lua = {
				augend.constant.new({
					elements = { 'true', 'false', 'nil' },
					word = true,
					cyclic = true,
				}),
			},
			c = {
				augend.constant.new({
					elements = { 'TRUE', 'FALSE', 'NULL' },
					word = true,
					cyclic = true,
				}),
				augend.integer.alias.octal,
			},
			rust = {
				augend.constant.new({
					elements = { 'true', 'false', 'None', 'Some' },
					word = true,
					cyclic = true,
				}),
			},
			javascript = {
				augend.constant.new({
					elements = { 'true', 'false', 'null', 'undefined' },
					word = true,
					cyclic = true,
				}),
			},
			python = {
				augend.constant.new({
					elements = { 'True', 'False', 'None' },
					word = true,
					cyclic = true,
				}),
			},
			go = {
				augend.constant.new({
					elements = { 'true', 'false', 'nil' },
					word = true,
					cyclic = true,
				}),
			},
			sh = {
				augend.constant.new({
					elements = { 'true', 'false' },
					word = true,
					cyclic = true,
				}),
			},
		}

		local map = vim.keymap.set
		map('n', '<C-a>', function()
			return require('dial.map').inc_normal()
		end, { expr = true, desc = 'Increment' })
		map('n', '<C-b>', function()
			return require('dial.map').dec_normal()
		end, { expr = true, desc = 'Decrement' })
		map('n', 'g<C-a>', function()
			return require('dial.map').inc_gnormal()
		end, { expr = true, desc = 'Increment (global)' })
		map('n', 'g<C-b>', function()
			return require('dial.map').dec_gnormal()
		end, { expr = true, desc = 'Decrement (global)' })
		map('v', '<C-a>', function()
			return require('dial.map').inc_visual()
		end, { expr = true, desc = 'Increment (visual)' })
		map('v', '<C-b>', function()
			return require('dial.map').dec_visual()
		end, { expr = true, desc = 'Decrement (visual)' })

		if dial_config.augends.register_group then
			dial_config.augends:register_group({
				default = common_augends,
				lua = vim.list_extend(common_augends, language_configs.lua),
				c = vim.list_extend(common_augends, language_configs.c),
				rust = vim.list_extend(common_augends, language_configs.rust),
				javascript = vim.list_extend(common_augends, language_configs.javascript),
				python = vim.list_extend(common_augends, language_configs.python),
				go = vim.list_extend(common_augends, language_configs.go),
				sh = vim.list_extend(common_augends, language_configs.sh),
			})
		else
			vim.notify('dial.nvim: register_group not available, using default augends', vim.log.levels.WARN)
			dial_config.augends.group = {
				default = common_augends,
				lua = vim.list_extend(common_augends, language_configs.lua),
				c = vim.list_extend(common_augends, language_configs.c),
				rust = vim.list_extend(common_augends, language_configs.rust),
				javascript = vim.list_extend(common_augends, language_configs.javascript),
				python = vim.list_extend(common_augends, language_configs.python),
				go = vim.list_extend(common_augends, language_configs.go),
				sh = vim.list_extend(common_augends, language_configs.sh),
			}
		end

		vim.api.nvim_create_autocmd('FileType', {
			pattern = { 'lua', 'c', 'rust', 'javascript', 'python', 'go', 'sh' },
			callback = function(args)
				local filetype = args.match
				vim.b.dial_group = filetype
			end,
		})
	end,
}
