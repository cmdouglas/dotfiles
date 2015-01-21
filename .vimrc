" load modules
execute pathogen#infect()
execute pathogen#helptags()

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
set wildignore+=.*.sw*,__pycache__,*.pyc,bin/,

" miscellany
set autoread " reload changed files
set scrolloff=2 " always have 2 lines of context on the screen
set foldmethod=indent " auto-fold based on indentation. (py-friendly)
set foldlevel=99
set timeoutlen=1000 " wait 1s for mappings to finish
set ttimeoutlen=100 " wait 0.1s for xterm keycodes to finish
set nrformats-=octal " don't try to auto-increment 'octal'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"

" Syntastic
" " Don't bother flaking on :wq because I won't even see it!
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" " Only use flake8 for Python -- running `python` itself may or may not work
" " because versions, and pylint is a beast
let g:syntastic_python_checkers = ['flake8']

" Jedi
let g:jedi#popup_on_dot = 0
" " messing with my completeopt is super rude
let g:jedi#auto_vim_configuration = 0
let g:jedi#show_call_signature=0

" Python-mode; disable linting, use syntastic
let g:pymode_lint = 0
" " Aaand the rope stuff conflicts with jedi, surprise
let g:pymode_rope = 0
" " Rope is fucking idiotic and keeps recursively reading my entire home
" " directory. This at least tells it not to search upwards looking for a
" " .ropeproject marker.
let g:pymode_rope_lookup_project = 0
" " This is pretty fucking annoying too
let g:pymode_rope_complete_on_dot = 0
" this doesn't work with python3.4 venvs
let g:pymode_virtualenv=0

" Airline; use powerline-style glyphs and colors
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and syntax
" " in GUI or color console, enable coloring and search highlighting
if &t_Co > 2 || has("gui_running")
    syntax enable
    set background=dark
    set hlsearch
endif

set t_Co=256 " force 256 colors

colorscheme molokai

if has("autocmd")
    " " Filetypes and indenting settings
    filetype plugin indent on

    " " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " " When editing a file, always jump to the last known cursor position.
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ exe "normal g`\"" |
        \ endif
    endif " has("autocmd")

" " trailing whitespace and column; must define AFTER colorscheme, setf, etc!
hi ColorColumn ctermbg=black guibg=darkgray
hi WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+\%#\@<!$/

" " molokai's diff coloring is terrible
highlight DiffAdd ctermbg=22
highlight DiffDelete ctermbg=52
highlight DiffChange ctermbg=17
highlight DiffText ctermbg=53
