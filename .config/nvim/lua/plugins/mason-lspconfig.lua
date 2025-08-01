return {
  "williamboman/mason-lspconfig.nvim",
  version = "*",
  lazy = false,
  config = function()
    local lsp_servers = { "lua_ls", "pyright", "ruff", "ts_ls", "html", "yamlls", "jsonls" }
    local diagnostics = { "typos_lsp" }

    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_flatten({ lsp_servers, diagnostics }),
    }

    -- もし setup_handlers があるなら使う
    if mason_lspconfig.setup_handlers then
      mason_lspconfig.setup_handlers {
        function(server_name)
          if server_name == "typos_lsp" then
            lspconfig.typos_lsp.setup({})
          elseif server_name == "pyright" then
            lspconfig.pyright.setup({
              root_dir = lspconfig.util.root_pattern(".venv"),
              settings = {
                python = {
                  venvPath = ".",
                  pythonPath = "./.venv/bin/python",
                }
              }
            })
          else
            lspconfig[server_name].setup({})
          end
        end,
      }
    else
      -- 古い mason-lspconfig では直接設定
      for _, server_name in ipairs(vim.tbl_flatten({ lsp_servers, diagnostics })) do
        if server_name == "typos_lsp" then
          lspconfig.typos_lsp.setup({})
        elseif server_name == "pyright" then
          lspconfig.pyright.setup({
            root_dir = lspconfig.util.root_pattern(".venv"),
            settings = {
              python = {
                venvPath = ".",
                pythonPath = "./.venv/bin/python",
              }
            }
          })
        else
          lspconfig[server_name].setup({})
        end
      end
    end

    -- キーマッピング
    vim.keymap.set('n', 'K', vim.lsp.buf.hover)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
    vim.keymap.set('n', 'gt', '<C-t>')
    vim.keymap.set('n', 'gf', function() vim.lsp.buf.format({ async = true }) end)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', 'gn', vim.lsp.buf.rename)
  end,
}
