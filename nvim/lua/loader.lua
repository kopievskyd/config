local M = {}

function M.lazy(pkg, config, callback)
	config = config or {}
	local cb = type(pkg) == "function" and pkg
		or function()
			vim.cmd.packadd(pkg)
			require(pkg).setup(config)
			if callback then
				callback()
			end
		end
	vim.api.nvim_create_autocmd("User", {
		pattern = "Lazy",
		once = true,
		callback = cb,
	})
end

function M.cmd(cmd, pkg, config)
	config = config or {}
	vim.api.nvim_create_user_command(cmd, function(opts)
		pcall(vim.api.nvim_del_user_command, cmd)
		vim.cmd.packadd(pkg)
		require(pkg).setup(config)
		local args = opts.args or ""
		vim.cmd(cmd .. " " .. args)
	end, {
		nargs = "*",
	})
end

function M.event(event, pkg, config)
	config = config or {}
	vim.api.nvim_create_autocmd(event, {
		once = true,
		callback = function()
			vim.cmd.packadd(pkg)
			require(pkg).setup(config)
		end,
	})
end

function M.setup()
	local function trigger()
		vim.schedule(function()
			if vim.v.exiting == vim.NIL then
				vim.api.nvim_exec_autocmds("User", {
					pattern = "Lazy",
					modeline = false,
				})
			end
		end)
	end

	if vim.v.vim_did_enter == 1 then
		trigger()
	else
		vim.api.nvim_create_autocmd("UIEnter", {
			once = true,
			callback = trigger,
		})
	end
end

return M
