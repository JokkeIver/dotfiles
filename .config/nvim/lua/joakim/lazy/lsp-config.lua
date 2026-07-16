return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Configure LSP servers
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("svelte", {
        capabilities = capabilities,
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("texlab", {
        capabilities = capabilities,
      })

      vim.lsp.config("jdtls", {
        capabilities = capabilities,
      })

      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        settings = {
          gopls = {
            gofumpt = true,
            usePlaceholders = true,

            hints = {
              assignVariableTypes = true,
            },

            codelenses = {
              generate = true,
              gc_details = true,
            },

            analyses = {
              unusedparams = true,
            },

            staticcheck = true,
          },
        },
      })

      -- Enable LSP servers
      vim.lsp.enable({
        "lua_ls",
        "svelte",
        "clangd",
        "texlab",
        "jdtls",
        "cssls",
        "ts_ls",
        "gopls",
      })

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "svelte",
          "clangd",
          "texlab",
          "jdtls",
          "html",
          "cssls",
          "ts_ls",
          "gopls",
        },
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
}
