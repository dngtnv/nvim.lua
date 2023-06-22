return {
  -- VIEW --
  { "nvim-tree/nvim-web-devicons" },                          -- Display web icons
  { "EdenEast/nightfox.nvim" },                               -- THEME
  { "folke/tokyonight.nvim" },                                -- THEME
  { "catppuccin/nvim",                            name = "catppuccin",   priority = 1000 }, -- THEME
  -- LSP --
  { "williamboman/mason.nvim",                    build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jose-elias-alvarez/typescript.nvim" },         -- provides basic code refactoring features
  { "rafamadriz/friendly-snippets" },               -- Snippets collection
  { "onsails/lspkind-nvim" },                       -- Vscode-like pictograms for nvim lsp completion items
  -- {"github/copilot.vim"}, -- AI code suggestions
  { "windwp/nvim-ts-autotag" },                     -- Autotag & autorename
  { "JoosepAlviste/nvim-ts-context-commentstring" }, -- Comment for ts file
}
