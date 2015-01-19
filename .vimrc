" load modules
execute pathogen#infect()

set nobackup
set writebackup
set undodir=~/.vim/undo
set undofile

set matchtime=2
set number
set showmatch
set cursorline
set shiftwidth=4
set softtabstop=4
set expandtab

set ignorecase
set smartcase
set showbreak=↳\ 
set ttymouse=xterm2 " force mouse support for screen
set mouse=a " terminal mouse when possible
set wildmenu " show a menu of completions like zsh
set wildmode=full " complete longest common prefix first
set wildignore+=.*.sw*,__pycache__,*.pyc

" miscellany
set autoread " reload changed files
set scrolloff=2 " always have 2 lines of context on the screen
set foldmethod=indent " auto-fold based on indentation. (py-friendly)
set foldlevel=99
set timeoutlen=1000 " wait 1s for mappings to finish
set ttimeoutlen=100 " wait 0.1s for xterm keycodes to finish
set nrformats-=octal " don't try to auto-increment 'octal'
