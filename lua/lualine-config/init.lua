local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    print('Lualine is not installed')
    return
end

lualine.setup {
    options = {
        icons_enabled = true,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    }
}
