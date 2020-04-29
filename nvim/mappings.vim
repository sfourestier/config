"{ Custom key mappings
" Turn the word under cursor to upper case
inoremap <silent> <c-u> <Esc>viwUea

" Shortcut for faster save and quit
nnoremap <silent> <leader>w :update<CR>
" Saves the file if modified and quit
nnoremap <silent> <leader>q :x<CR>
" Quit all opened buffers
nnoremap <silent> <leader>Q :qa<CR>


" Navigation in the location and quickfix list
nnoremap [l :lprevious<CR>zv
nnoremap ]l :lnext<CR>zv
nnoremap [L :lfirst<CR>zv
nnoremap ]L :llast<CR>zv
nnoremap [q :cprevious<CR>zv
nnoremap ]q :cnext<CR>zv
nnoremap [Q :cfirst<CR>zv
nnoremap ]Q :clast<CR>zv


" Yank from current cursor position to the end of the line (make it
" consistent with the behavior of D, C)
nnoremap Y y$

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %


" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_


" Resize windows using <Alt> and h,j,k,l, inspiration from
" https://vim.fandom.com/wiki/Fast_window_resizing_with_plus/minus_keys
" (bottom page). If you enable mouse support, shorcuts below may not be
" necessary.
nnoremap <silent> <M-h> <C-w><
nnoremap <silent> <M-l> <C-w>>
nnoremap <silent> <M-j> <C-W>-
nnoremap <silent> <M-k> <C-W>+


" Fast window switching, inspiration from
" https://stackoverflow.com/a/4373470/6064933
nnoremap <silent> <M-left> <C-w>h
nnoremap <silent> <M-right> <C-w>l
nnoremap <silent> <M-down> <C-w>j
nnoremap <silent> <M-up> <C-w>k

"" When completion menu is shown, use <cr> to select an item and do not add an
"" annoying newline. Otherwise, <enter> is what it is. For more info , see
"" https://superuser.com/a/941082/736190 and
"" https://unix.stackexchange.com/q/162528/221410
"inoremap <expr> <cr> ((pumvisible())?("\<C-Y>"):("\<cr>"))
"" Use <esc> to close auto-completion menu
"inoremap <expr> <esc> ((pumvisible())?("\<C-e>"):("\<esc>"))

" Edit and reload init.vim quickly
nnoremap <silent> <leader>ev :tabnew $MYVIMRC <bar> tcd %:h<cr>
nnoremap <silent> <leader>sv :silent update $MYVIMRC <bar> source $MYVIMRC <bar>
    \ echomsg "Nvim config successfully reloaded!"<cr>

" Search in selected region
vnoremap / :<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>


" Find and replace (like Sublime Text 3)
nnoremap <C-H> :%s/
xnoremap <C-H> :s/

" Decrease indent level in insert mode with shift+tab
inoremap <S-Tab> <ESC><<i

" Change text without putting it into the vim register,
" see https://stackoverflow.com/q/54255/6064933
nnoremap c "_c
nnoremap C "_C
nnoremap cc "_cc

" check the syntax group of current cursor position
nnoremap <silent> <leader>st :call utils#SynGroup()<CR>

" Copy entire buffer
nnoremap <silent> <leader>y :%y<CR>

"{ Django
let g:last_relative_dir = ''
nnoremap !& :call RelatedFile ("models.py")<cr>
nnoremap !é :call RelatedFile ("views.py")<cr>
nnoremap !" :call RelatedFile ("urls.py")<cr>
nnoremap !' :call RelatedFile ("admin.py")<cr>
nnoremap !( :call RelatedFile ("tests.py")<cr>
nnoremap !- :call RelatedFile ( "templates/" )<cr>
nnoremap !è :call RelatedFile ( "templatetags/" )<cr>
nnoremap !_ :call RelatedFile ( "management/" )<cr>
nnoremap !ç :e settings.py<cr>
nnoremap !à :e urls.py<cr>

fun! RelatedFile(file)
    "This is to check that the directory looks djangoish
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        exec "edit %:h/" . a:file
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
    if g:last_relative_dir != ''
        exec "edit " . g:last_relative_dir . a:file
        return ''
    endif
    echo "Cant determine where relative file is : " . a:file
    return ''
endfun

fun SetAppDir()
    if filereadable(expand("%:h"). '/models.py') || isdirectory(expand("%:h") . "/templatetags/")
        let g:last_relative_dir = expand("%:h") . '/'
        return ''
    endif
endfun
autocmd BufEnter *.py call SetAppDir()
"}

"{ F# mappings
" Custom date for todo file
map <F1> :put =utils#Date()<CR>

" Toggle spell checking (autosave does not play well with z=, so we disable it
" when we are doing spell checking)
nnoremap <silent> <F9> :set spell! <bar> :AutoSaveToggle<cr>
inoremap <silent> <F9> <C-O>:set spell! <bar> :AutoSaveToggle<cr>

" Undotree
nnoremap <F10> :UndotreeToggle<CR>

" <F11> fullscreen
"}


