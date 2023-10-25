" tab navigation 
map <S-h> gT
map <S-l> gt
map <C-h> gT
map <C-l> gt
nmap <S-t> :tabnew<CR>
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" refresh all tabs
map <leader>tr :checkt<cr>

" open file in a new tab 
nmap <leader>t <Esc>:tabe 

" pastetoggle (sane indentation on pastes)
set pastetoggle=<F12> 
"
" commenting in visual mode
vmap  o  :call NERDComment(1, 'toggle')<CR>
vmap  O  :call NERDComment(1, 'toggle')<CR>

" search options
set nohls " hlsearch if want highlighting
set incsearch
set ignorecase
set smartcase
set nu
