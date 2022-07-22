return {
  plugins = {
    'tpope/vim-commentary',
    'tpope/vim-surround',
    'lewis6991/gitsigns.nvim',
    'vim-utils/vim-man',
    'godlygeek/tabular',
    'dylanaraps/wal.vim',
    'mboughaba/i3config.vim',
    { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },
    {
      'w0rp/ale',
      ft = { 'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex' },
      cmd = 'ALEEnable',
      config = 'vim.cmd[[ALEEnable]]'
    },

    {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    },
    "b0o/mapx.nvim",
    "preservim/nerdtree",

    -- -- Extras

    -- 'edkolev/tmuxline.vim',
    'vim-airline/vim-airline',
    'vim-airline/vim-airline-themes',
    'ciaranm/inkpot',
    'morhetz/gruvbox',
    'whatyouhide/vim-gotham',
    -- 'ryanoasis/vim-devicons',
    -- 'vim-scripts/xoria256.vim',
    -- 'altercation/vim-colors-solarized',
    'Yggdroot/indentLine',
    -- 'tpope/vim-dispatch',
    'nightsense/carbonized',
    -- 'dim13/smyck.vim',
    -- 'baines/vim-colorscheme-thaumaturge',
    'elmindreda/vimcolors',
    -- 'chr4/jellygrass.vim',
    -- 'Zabanaa/neuromancer.vim',
    { 'norcalli/nvim-colorizer.lua', as = 'colorizer', opt = true },
    { 'junegunn/vim-easy-align', as = 'easy-align', opt = true },
    { 'mechatroner/rainbow_csv', opt = true },
    -- {'ms-jpq/chadtree', branch = 'chad', run = '!python3 -m chadtree deps'}

  },
  setup = function()
    vim.o.regexpengine=1

    vim.o.textwidth   =  80
    vim.o.tabstop     =  2
    vim.o.softtabstop =  2
    vim.o.shiftwidth  =  2
    vim.o.backspace   =  'indent,eol,start'
    vim.o.copyindent  =  true
    vim.o.autoindent  =  true
    vim.o.expandtab   =  true
    vim.o.smarttab    =  true
    vim.o.showmode    =  true
    -- vim.o.nowrap      =  true
    vim.o.smartcase   =  true
    vim.o.incsearch   =  true

    vim.o.number         =  true
    vim.o.relativenumber =  true

    vim.o.visualbell   =  true
    -- vim.o.noerrorbells =  true
    vim.o.autowrite    =  true
    vim.o.linespace    =  5
    vim.o.laststatus   =  2
    vim.o.scrolloff    =  5

    vim.o.cursorline = true
    vim.cmd 'highlight CursorLine gui=underline ctermbg=0'

    vim.cmd 'autocmd FileType gitcommit vim.o.textwidth=72'
    vim.cmd 'highlight ExtraWhitespaces ctermbg=red guibg=red'
    vim.cmd 'autocmd ColorScheme * highlight ExtraWhitespaces ctermbg=red guibg=red'

    vim.cmd 'colorscheme gotham256'

    require'mapx'.setup{ global = true  }

    require('telescope').setup{
      -- ...
    }

    -- Telescope mappings
    nnoremap('pp', "<cmd> lua require'telescope.builtin'.find_files{}<CR>")
    nnoremap('mm', "<cmd> lua require'telescope.builtin'.man_pages{}<CR>")
    -- nnoremap('/', "<cmd> lua require 'telescope.builtin'.current_buffer_fuzzy_find{}<CR>")
    nnoremap(';', "<cmd> lua require 'telescope.builtin'.lsp_definitions{}<CR>")
    nnoremap(';c', "<cmd> lua require 'telescope.builtin'.git_commits{}<CR>")


    -- Reindent mappings
    vnoremap('<', '<gv')
    vnoremap('>', '>gv')
    -- clipboard
    noremap('p', '"*p')
    noremap('y', '"*y')
  end,
}
