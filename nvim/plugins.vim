"{ Plugin management
call plug#begin('~/.local/share/nvim/plugged')
"{{ UI
" Theme
Plug 'nanotech/jellybeans.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"}}

"{{ Vim
" Highlight your yank aera
"Plug 'machakann/vim-highlightedyank'

" Super fast movement with vim-sneak
Plug 'justinmk/vim-sneak'
" s{char}{char}
" ; next
" , prev
" <Ctrl-o> starting point

" Autosave files on certain events
Plug '907th/vim-auto-save'

" Graphcial undo history, see https://github.com/mbbill/undotree
Plug 'mbbill/undotree'
"}}

"{{ Auto-completion
" Auto-completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Insert mode completion
Plug 'ervandew/supertab'

" Automatic quote and bracket completion
"Plug 'jiangmiao/auto-pairs'
"}}

"{{ Code
" Comment plugin
Plug 'scrooloose/nerdcommenter'
" <leader>cc: comment
" <leader>cu: uncomment

" Code auto-format
Plug 'sbdchd/neoformat'
" :Neoformat

" Code jump (go-to)
Plug 'davidhalter/jedi-vim'
" <leader>d: go to definition
" K: check documentation of class or method
" <leader>n: show the usage of a name in current file
" <leader>r: rename a name

" File managing and exploration
Plug 'scrooloose/nerdtree'
" :NERDTree
" <Ctrl-w-w>: switch window
" q: close file explorer

" Code checker
Plug 'neomake/neomake'
" :Neomake

" Multiple cursor editting
Plug 'terryma/vim-multiple-cursors'
" <Ctrl-N>: select current and jump to next variable
" <Ctrl-X>: jump to next variable
" c: change all cursors

" Code folding
Plug 'tmhedberg/SimpylFold'
" zo： Open fold in current cursor postion
" zO： Open fold and sub-fold in current cursor postion recursively
" zc： Close the fold in current cursor position
" zC： Close the fold and sub-fold in current cursor position recursively
"}}

"{{ Python
" Python auto-completion
Plug 'zchee/deoplete-jedi'

" Python syntax highlighting and more
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }

" Python indent (follows the PEP8 style)
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}

" Python-related text object
Plug 'jeetsukumaran/vim-pythonsense'
"}}

"{{ Git
" Show git change (change, delete, add) signs in vim sign column
Plug 'mhinz/vim-signify'

" Git command inside vim
Plug 'tpope/vim-fugitive', {'on': ['Gstatus']}
" :G cmd

" Git commit browser
Plug 'junegunn/gv.vim', { 'on': 'GV' }
" :GV to open commit browser
"     You can pass git log options to the command, e.g. :GV -S foobar
" :GV! will only list commits that affected the current file
" :GV? fills the location list with the revisions of the current file
" o or <cr> on a commit to display the content of it
"}}

"{{ Text object plugins
" Additional powerful text object for vim, this plugin should be studied
" carefully to use its full power
Plug 'wellle/targets.vim'

" Plugin to manipulate characer pairs quickly
Plug 'tpope/vim-surround'

" Add indent object for vim (useful for languages like Python)
Plug 'michaeljsmith/vim-indent-object'

" Tex folding
Plug 'matze/vim-tex-fold'
"}}

"{{ LaTeX
" Snippets engine
Plug 'SirVer/ultisnips'

" Snippets
Plug 'honza/vim-snippets'

" Vim-LaTeX
Plug 'lervag/vimtex'
" fig<Tab>
" ]]: close environment
" cse: change an environment
" dse: delete an environment

" Affichage des caractères spéciaux
Plug 'KeitaNakamura/tex-conceal.vim'
"}}

"{{ Encryption
" Allow transparent file encryption
Plug 'jamessan/vim-gnupg'
" Ajouter dans .bash_export :
" export GPG_TTY=`tty`
"
" Créer ~/.gnupg/gpg-agent.conf, avec :
" pinentry-program /usr/bin/pinentry-curses
"
" Pour chiffrer un fichier :
" gpg -c fichier
"}}
call plug#end()
"}

"{ Plugin settings
"{{ Vim-plug settings
" Use shortnames for common vim-plug command to reduce typing.
" To use these shortcut: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded
" to the full command automatically
call utils#Cabbrev('pi', 'PlugInstall')
call utils#Cabbrev('pud', 'PlugUpdate')
call utils#Cabbrev('pug', 'PlugUpgrade')
call utils#Cabbrev('ps', 'PlugStatus')
call utils#Cabbrev('pc', 'PlugClean')
"}}

"{{ UI
" Airline
let g:airline_theme='bubblegum'
"let g:airline_section_z='%3p%% %#__accent_bold#%{g:airline_symbols.linenr}%4l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__# :%3v'
let g:airline_section_z = airline#section#create([
      \ 'windowswap',
      \ '%3p%%'.g:airline_symbols.space.g:airline_symbols.space,
      \ '%3l/%3L'.g:airline_symbols.space,
      \ ':%3v/%2{strwidth(getline("."))}'.g:airline_symbols.space
  \])
"}}

"{{ Vim
" Highlightedyank
" Reverse highlighted colors (according to used colorsheme)
" hi HighlightedyankRegion cterm=reverse gui=reverse
" Set highlight duration time to 1000 ms, i.e., 1 second
"let g:highlightedyank_highlight_duration = 1000
"}}

"{{ Auto-completion
"Deoplete
let g:deoplete#enable_at_startup = 1
" Close the preview window automatically
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" Put the preview window below the current window
set splitbelow
" Navigate in the auto-completion list with Tab
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"}}

"{{ Code
" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Jedi-vim
" disable autocompletion, cause we use deoplete for completion
"let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
"let g:jedi#use_splits_not_buffers = "right"
augroup pyjedi
    autocmd!
    autocmd FileType python setlocal omnifunc=jedi#completions
                                \ textwidth=79
                                \ completeopt+=preview
                                \ formatoptions+=c
augroup END

" Neomake
" Set pylint as python code checker
let g:neomake_python_enabled_makers = ['flake8']
" Extensively checks on your code (should be a bit slow)
call neomake#configure#automake('nrwi', 500)
"}}

"{{ Python
"}}

"{{ Git
" Vim-signify
" default updatetime 4000ms is not good for async update
set updatetime=100
"}}

"{{ Text object plugins
"}}

"{{ LaTeX
" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Use LaTeX auto-completion
call deoplete#custom#var('omni', 'input_patterns', {
      \ 'tex': g:vimtex#re#deoplete
      \})

" Set proselint as LaTeX code checker
let g:neomake_tex_enabled_makers = []

" Vimtex
let g:tex_flavor='latex'
"let g:vimtex_view_method = 'okular'
let g:vimtex_quickfix_mode=0

" Tex conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

"}}
"}
