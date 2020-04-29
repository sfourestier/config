" ColorColumn
":let &colorcolumn="73,80"
:hi ColorColumn ctermbg=30 guibg=dark
nnoremap <F10> :execute "set colorcolumn=" . (&colorcolumn == "" ? "73,80" : "")<CR>

" Python
map <F2> :!python %:p<cr>

" Neoformat
noremap <F5> :Neoformat<CR>

nnoremap <C-n> :lnext<CR>
nnoremap <C-p> :lprev<CR>

set spelllang=en
