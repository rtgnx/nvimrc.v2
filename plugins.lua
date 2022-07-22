local function bootstrap()
  local path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'

  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path,
    }
  end


  -- Load Paq
  vim.cmd 'packadd paq-nvim'
  local paq = require 'paq'

  -- Exit nvim after installing plugins
  -- vim.cmd 'autocmd User PaqDoneInstall quit'

  -- Read and install packages
  -- paq(PKGS):install()

end

local function install(pkgs)
    local paq = require 'paq'
    paq(pkgs):install()
end

return { bootstrap = bootstrap, install = install }
