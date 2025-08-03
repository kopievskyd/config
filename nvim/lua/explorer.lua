local M = {}

function M.toggle()
	if vim.api.nvim_buf_get_option(0, "filetype") == "netrw" then
		local bufs = vim.fn.getbufinfo({ buflisted = 1 })
		return vim.cmd(#bufs > 0 and "b#" or "bdelete")
	end
	vim.cmd("Explore")
end

return M
