"{ Builtin options and settings
" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=1000

" For CursorHold events
set updatetime=2000

" Clipboard settings, always use clipboard for all delete, yank, change, put
" operation, see https://stackoverflow.com/q/30691466/6064933
set clipboard+=unnamedplus

" Disable creating swapfiles, see https://stackoverflow.com/q/821902/6064933
set noswapfile

" Set matching pairs of characters and highlight matching brackets
set matchpairs+=<:>,「:」

" Ignore case in general, but become case-sensitive when uppercase is present
set ignorecase smartcase

" Break line at predefined characters
set linebreak
" Character to show before the lines that have been soft-wrapped
set showbreak=↪

" List all items and start selecting matches in cmd completion
set wildmode=list:full

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=3

" Use mouse to select and resize windows, etc.
"set mouse=nic  " Enable mouse in several mode
"set mousemodel=popup  " Set the behaviour of mouse

" Do not show mode on command line since vim-airline can show it
set noshowmode

" Fileformats to use for new files
set fileformats=unix,dos

" The way to show the result of substitution in real time for preview
set inccommand=nosplit

" Ignore certain files and folders when globbing
set wildignore+=*.o,*.obj,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.pyc
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz

" Ask for confirmation when handling unsaved or read-only files
set confirm

" Do not use visual and errorbells
set visualbell noerrorbells

" The level we start to fold
"set foldlevel=0

" The number of command and search history to keep
set history=500

" Use list mode and customized listchars
set list listchars=tab:▸\ ,extends:❯,precedes:❮,nbsp:+

" Auto-write the file based on some condition
set autowrite

" Show hostname, full path of file and last-mod time on the window title. The
" meaning of the format str for strftime can be found in
" http://man7.org/linux/man-pages/man3/strftime.3.html. The function to get
" lastmod time is drawn from https://stackoverflow.com/q/8426736/6064933
set title
set titlestring=
set titlestring+=%(%{hostname()}\ \ %)
set titlestring+=%(%{expand('%:p')}\ \ %)
set titlestring+=%{strftime('%Y-%m-%d\ %H:%M',getftime(expand('%')))}

" Persistent undo even after you close a file and re-open it
set undofile

" Do not show "match xx of xx" and other messages during auto-completion
set shortmess+=c

" Completion behaviour
" set completeopt+=noinsert  " Auto select the first completion entry
set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window

" Settings for popup menu
set pumheight=15  " Maximum number of items to show in popup menu

" Scan files given by `dictionary` option
set complete+=k,kspell complete-=w complete-=b complete-=u complete-=t

" Dictionary files for different systems
let g:MY_DICT = expand(g:nvim_config_root . '/dict/words')
let &dictionary = &dictionary . ',' . g:MY_DICT

set spelllang=fr      " Spell languages
set spellsuggest+=10  " The number of suggestions shown in the screen for z=

" Align indent to next multiple value of shiftwidth. For its meaning,
" see http://vim.1045645.n5.nabble.com/shiftround-option-td5712100.html
set shiftround

" Virtual edit is useful for visual block edit
set virtualedit=block

" Correctly break multi-byte characters such as CJK,
" see https://stackoverflow.com/q/32669814/6064933
set formatoptions+=mM

" Tilde (~) is an operator, thus must be followed by motions like `e` or `w`.
"set tildeop

" Do not add two spaces after a period when joining lines or formatting texts,
" see https://stackoverflow.com/q/4760428/6064933
set nojoinspaces

" Text after this column number is not highlighted
set synmaxcol=500

set nostartofline

" External program to use for grep command
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m
endif

" Turn on backup
set backup
set writebackup

" Fine use of Tabs
set tabstop=4           " width of a hard tabstop
set softtabstop=0       " do simulate tab with space/tabs 
set expandtab           " insert spaces instead of tab 
set shiftwidth=4        " the size of an 'indent'
set smarttab            " insert spaces or tabs to go to the next indent

" Line size
set tw=79

" activate filetypes
filetype plugin on
"}
