local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
    print('Null-ls is not installed')
    return
end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.prettier,
    -- null_ls.builtins.diagnostics.luacheck,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.code_actions.gitsigns,
}

local callback = function()
    vim.lsp.buf.format({
        bufnr = bufnr,
        filter = function(client)
            return client.name == "null-ls"
        end
    })
end,

    null_ls.setup({
        sources = sources,
        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                        --vim.lsp.buf.formatting_sync()
                        vim.lsp.buf.format({ timeout_ms = 3000, bufnr = bufnr })
                    end,
                })
            end
        end,
    })
