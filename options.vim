" UI settings
set number
set showmatch
set foldmethod=marker
set colorcolumn=64,78
set splitright
set splitbelow
set ignorecase
set smartcase
set linebreak
set termguicolors
set laststatus=3
set relativenumber
set encoding=utf-8
set confirm
set shortmess=IfilnxtToOF
set noshowmode
set mouse=a

" Spell Checking
set spell
set spelllang=en,el

" Performance
set history=100
set hidden
set updatetime=250
set undofile

" Code Preference
set shiftwidth=4
set tabstop=4
set smartindent
set expandtab

"Trails etc
set list
set listchars=tab:»\ ,nbsp:␣,eol:↲,trail:~
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99
