local status_ok, todoComment = pcall(require, "todo-comments")
if not status_ok then
	print("todo-comments is not installed")
	return
end

todoComment.setup({
	signs = true, -- show icons in the signs column
	sign_priority = 8, -- sign priority
})
-- Mapping --
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

--[[ vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
end, { desc = "Next error/warning todo comment" }) ]]
