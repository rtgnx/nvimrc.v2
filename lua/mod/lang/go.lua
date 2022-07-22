return {
  plugins = {
    'ray-x/go.nvim',
  },
  setup = function()
    local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

    require('go').setup({
      -- other setups ....
      lsp_cfg = {
        capabilities = capabilities,
        -- other setups
      },
    })
    -- Run gofmt + goimport on save
    vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
  end
}
