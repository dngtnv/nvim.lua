local status_ok, indentbl= pcall(require, 'indent-blankline')
if not status_ok then
    print('Indent-blankline is not installed')
    return
end

indentbl.setup {
    show_current_context = true,
    show_current_context_start = true,
}
