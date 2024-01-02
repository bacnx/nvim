return {
  {
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          gopls = {
            settings = {
              gopls = {
                gofumpt = false,
                codelenses = {
                  gc_details = false,
                  generate = true,
                  regenerate_cgo = true,
                  run_govulncheck = true,
                  test = true,
                  tidy = true,
                  upgrade_dependency = true,
                  vendor = true,
                },
                hints = {
                  assignVariableTypes = true,
                  compositeLiteralFields = true,
                  compositeLiteralTypes = true,
                  constantValues = true,
                  functionTypeParameters = true,
                  parameterNames = true,
                  rangeVariableTypes = true,
                },
                analyses = {
                  fieldalignment = true,
                  nilness = true,
                  unusedparams = true,
                  unusedwrite = true,
                  useany = true,
                },
                usePlaceholders = true,
                completeUnimported = true,
                staticcheck = true,
                directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                semanticTokens = true,
              },
            },
          },
        },
      },
    },
    -- Ensure Go tools are installed
    {
      "williamboman/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, { "goimports" })
      end,
    },
    {
      "nvimtools/none-ls.nvim",
      optional = true,
      dependencies = {
        {
          "williamboman/mason.nvim",
          opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "gomodifytags", "impl" })
          end,
        },
      },
      opts = function(_, opts)
        local nls = require("null-ls")
        opts.sources = vim.list_extend(opts.sources or {}, {
          nls.builtins.code_actions.gomodifytags,
          nls.builtins.code_actions.impl,
          nls.builtins.formatting.goimports,
        })
      end,
    },
    {
      "stevearc/conform.nvim",
      optional = true,
      opts = {
        formatters_by_ft = {
          go = { "goimports" },
        },
      },
    },
    {
      "mfussenegger/nvim-dap",
      optional = true,
      dependencies = {
        {
          "williamboman/mason.nvim",
          opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            vim.list_extend(opts.ensure_installed, { "delve" })
          end,
        },
        {
          "leoluz/nvim-dap-go",
          config = true,
        },
      },
    },
    {
      "nvim-neotest/neotest",
      optional = true,
      dependencies = {
        "nvim-neotest/neotest-go",
      },
      opts = {
        adapters = {
          ["neotest-go"] = {
            -- Here we can set options for neotest-go, e.g.
            -- args = { "-tags=integration" }
          },
        },
      },
    },
  },
}
