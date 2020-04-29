let g:nvim_config_root = expand('<sfile>:p:h')

let g:config_file_list = ['variables.vim',
    \ 'options.vim',
    \ 'autocommands.vim',
    \ 'mappings.vim',
    \ 'options.vim',
    \ 'plugins.vim',
    \ 'ui.vim'
    \ ]

for s:fname in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . s:fname
endfor
