require("loader").cmd("Pick", "mini.pick", {
	window = {
		config = function()
			local height = math.floor(0.4 * vim.o.lines)
			local width = math.floor(0.6 * vim.o.columns)
			return {
				anchor = "NW",
				height = height,
				width = width,
				row = math.floor(0.4 * (vim.o.lines - height)),
				col = math.floor(0.5 * (vim.o.columns - width)),
			}
		end,
	},
})
