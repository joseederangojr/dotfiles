return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim", config = {} },
      "williamboman/mason-lspconfig.nvim",
      {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
          ensure_installed = {
            "tailwindcss",
            "intelephense",
            "biome",
            "emmet_language_server",
            "yamlls",
            "jsonls",
            "lua_ls",
          },
        },
      },

      { "j-hui/fidget.nvim", opts = {} },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
      { "b0o/SchemaStore.nvim" },
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          local builtin = require("telescope.builtin")
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "[L]SP: " .. desc })
          end
          map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
          map("gr", builtin.lsp_references, "[G]oto [R]eferences")
          map("<leader>lgi", builtin.lsp_implementations, "[G]oto [I]mplementation")
          map("<leader>ltd", builtin.lsp_type_definitions, "[T]ype [D]efinition")
          map("<leader>lds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
          map("<leader>lws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<leader>lrn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>lca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          map("<leader>lgd", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map("<leader>lih", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
            end, "[L]SP [I]nlay [H]ints")
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local servers = {
        html = {},
        tailwindcss = {},
        intelephense = {},
        biome = {},
        emmet_language_server = {},
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              completion = true,
              validate = true,
              schemaStore = {
                enable = false,
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },
        jsonls = {
          settings = {
            json = {
              format = {
                enable = true,
              },
              validate = { enable = true },
              schemas = require("schemastore").json.schemas(),
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = {
                  "lua/?.lua",
                  "lua/?/init.lua",
                },
              },
              diagnostics = {
                globals = {
                  "vim",
                  "require",
                },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.api.nvim_get_runtime_file("", true),
                  vim.env.VIMRUNTIME,
                },
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
      }

      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = {},
        },
        ensure_installed = {},
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            require("lspconfig")[server_name].setup(server)
          end,
        },
      })
    end,
  },
}
