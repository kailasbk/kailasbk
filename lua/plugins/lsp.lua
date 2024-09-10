return {
  {
    "neovim/nvim-lspconfig",
    opts = function ()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys+1] = { "K", false }

      local ret = {
        diagnostics = {
          underline = true,
          update_in_insert = true,
          virtual_text = {
              spacing = 4,
              source = "if_many",
              prefix = "●",
          },
          severity_sort = true,
          signs = {
            text = {
              [vim.diagnostic.severity.ERROR] = LazyVim.config.icons.diagnostics.Error,
              [vim.diagnostic.severity.WARN] = LazyVim.config.icons.diagnostics.Warn,
              [vim.diagnostic.severity.HINT] = LazyVim.config.icons.diagnostics.Hint,
              [vim.diagnostic.severity.INFO] = LazyVim.config.icons.diagnostics.Info,
            },
          },
        },
        inlay_hints = {
          enabled = false,
        },
        codelens = {
          enabled = false,
        },
        document_highlight = {
          enabled = true,
        },
        capabilities = {
          workspace = {
              fileoperations = {
              didrename = true,
              willrename = true,
              },
          },
        },
        format = {
          formatting_options = nil,
          timeout_ms = nil,
        },
        servers = {
          lua_ls = {
            settings = {
            lua = {
              workspace = {
                checkthirdparty = false,
              },
              codelens = {
                enable = true,
              },
              completion = {
                callsnippet = "replace",
              },
              doc = {
                privatename = { "^_" },
              },
              hint = {
                enable = true,
                settype = false,
                paramtype = true,
                paramname = "disable",
                semicolon = "disable",
                arrayindex = "disable",
              },
            },
            },
          },
        },
        setup = {},
      }
      return ret
    end
  }
}
