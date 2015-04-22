set foldmethod=indent
set foldlevel=99

imap <F2> <ESC>:w<CR>:!python %<CR>
vmap <F2> <ESC>:w<CR>:!python %<CR>
nmap <F2> <ESC>:w<CR>:!python %<CR>

"Help Documentation
imap <F5> <ESC>:!python -c "help()"<CR>
vmap <F5> <ESC>:!python -c "help()"<CR>
nmap <F5> <ESC>:!python -c "help()"<CR>

"Completement
imap <C-C> <C-X><C-I>

color duzitong 
