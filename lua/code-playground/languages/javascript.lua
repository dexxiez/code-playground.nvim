local fileutils = require("code-playground.file-utils")
local root_path = vim.fs.joinpath(vim.fs.normalize(vim.fn.stdpath("data")), "code-playground")
local js_folder = vim.fs.joinpath(root_path, "javascript")
local index = vim.fs.joinpath(js_folder, "index.mjs")

local M = {}

local function ensure_files()
	local jsconfig = vim.fs.joinpath(js_folder, "jsconfig.json")
	fileutils.ensure_directory_exists(js_folder)
	fileutils.ensure_file_exists(index, "javascript/index.mjs")
	fileutils.ensure_file_exists(jsconfig, "javascript/jsconfig.json")
end

---@return Run
M.run = function()
	ensure_files()
	return {
		file = index,
		command = string.format("bun %s", index),
	}
end

M.reset = function()
	vim.fn.delete(js_folder, "rf")
end

return M
