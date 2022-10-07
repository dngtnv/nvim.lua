local status_ok, nvimtree = pcall(require, "nvim-tree")
if not status_ok then
    print("Nvim-tree is not installed")
    return
end

nvimtree.setup({
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = false,
    hijack_cursor = false,
    hijack_netrw = false,
    view = {
        adaptive_size = true,
        centralize_selection = true,
        side = "left",
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        float = {
            enable = false,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
        },
    },
    filters = {
        dotfiles = true,
    },
    diagnostics = {
        enable = false,
    },
    --[[ log = {
        enable = true,
        truncate = true,
        types = {
            git = true,
            profile = true,
        },
    }, ]]
})
