local mods = {
  require('mod.editor'),
  require('mod.lsp'),
  require('mod.lang.go'),
  require('mod.lang.shell'),
  require('mod.lang.ansible'),
}


return {
  packer = require('packer').startup(function()
    -- use Packer can manage itself
    use 'wbthomason/packer.nvim'
    -- Load on an autocommand event
    use { 'andymass/vim-matchup', event = 'VimEnter' }

    -- Load on a combination of conditions: specific filetypes or commands
    -- Also run code after load (see the "config" key)

    for i = 1, #mods do
      for j = 1, #mods[i].plugins do
        use(mods[i].plugins[j])
      end
    end

  end),
  setup = function()
    for i = 1, #mods do
      mods[i].setup()
    end
  end,
}
