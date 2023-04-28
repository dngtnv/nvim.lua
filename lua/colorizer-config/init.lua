local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
	print("Colorizer is not installed")
	return
end

colorizer.setup({
	filetyles = { "*" },
	user_default_options = {
		mode = "foreground",
		tailwind = true,
	},
})
