return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"jay-babu/mason-nvim-dap.nvim",
			dependencies = { "nvim-dap" },
			cmd = { "DapInstall", "DapUninstall" },
			opts = { automatic_setup = true },
			config = true,
		},
		{
			"rcarriga/nvim-dap-ui",
			opts = { floating = { border = "rounded" } },
			config = true
		},
	},
	keys = {
		{ "db",    "<Cmd>lua require'dap'.toggle_breakpoint()<CR>" },
		{ "<F5>",  "<Cmd>lua require'dap'.continue()<CR>" },
		{ "<F10>", "<Cmd>lua require'dap'.step_over()<CR>" },
		{ "<F11>", "<Cmd>lua require'dap'.step_into()<CR>" },
		{ "<F12>", "<Cmd>lua require'dap'.step_out()<CR>" },
		{ "dr",    "<Cmd>lua require'dap'.repl.open()<CR>" },
		{ "dl",    "<Cmd>lua require'dap'.run_last()<CR>" },
	},
	config = function()
		local dap = require('dap')
		dap.adapters.node2 = {
			type = 'executable',
			command = 'node',
			args = { os.getenv('HOME') .. '/local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
			--args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
		}
		dap.configurations.javascript = {
			{
				name = 'Launch',
				type = 'node2',
				request = 'launch',
				program = '${file}',
				cwd = vim.fn.getcwd(),
				sourceMaps = true,
				protocol = 'inspector',
				console = 'integratedTerminal',
			},
			{
				-- For this to work you need to make sure the node process is started with the `--inspect` flag.
				name = 'Attach to process',
				type = 'node2',
				request = 'attach',
				processId = require 'dap.utils'.pick_process,
			}
		}
	end
}
