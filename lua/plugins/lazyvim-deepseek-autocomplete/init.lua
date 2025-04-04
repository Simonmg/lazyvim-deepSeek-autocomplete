local M = {}

local deepseek = require("plugins.lazyvim-deepseek-autocomplete.deepseek")

local function on_text_changed(opts)
	-- ...
	vim.print(opts)
end

function M.setup(opts)
	local url = opts.url
	local token = opts.token

	vim.api.nvim_create_user_command("DeekSeekComplete", function()
		local current_line = vim.api.nvim_get_current_line()

		local completion = deepseek.get_completion(url, token, current_line)

		if completion then
			vim.print(completion)
		end
	end, {})
end

return M
