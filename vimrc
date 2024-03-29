" pathogen plugins
execute pathogen#infect()
call pathogen#helptags()

set nocompatible
filetype on
filetype plugin on

" colors
syntax enable
" fix bg color for screen/tmux http://bit.ly/2xyzST9
set t_ut=
" colorscheme
colorscheme oceanblack

" tabspacing
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal noet ts=4 sw=4 sts=4

set ttyfast
set noswapfile
set nobackup
set nowritebackup
set enc=utf-8
set fencs=utf-8
set visualbell t_vb=
set history=1000
set undolevels=1000
set wildmenu
set winwidth=300
set winminwidth=50
set tabpagemax=80
set showcmd " show partial commands in status line and selected characters/lines in visual mode
set autoread " Set to auto read when a file is changed from the outside

" search options
set nohls " hlsearch if want highlighting
set incsearch
set ignorecase
set smartcase
set nu

" wipe out highlights if using hlsearch
nnoremap <leader><space> :noh<cr>

" fix search regex 
nnoremap / /\v
vnoremap / /\v

" search a highlighted term
vmap  / y/<C-R>=substitute(escape(@", '\\/.*$^~[]'), "\n", "\\\\n", "g")<CR><CR>

" remap tab key to match bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" remap leader to comma 
let mapleader=","

" map jj to escape key
inoremap jj <ESC>

" commenting in visual mode
vmap  o  :call NERDComment(1, 'toggle')<CR>
vmap  O  :call NERDComment(1, 'toggle')<CR>

" yankring history
silent execute '!mkdir -p $HOME/.vim/tmp/yankring'
let g:yankring_history_dir = '$HOME/.vim/tmp/yankring'
let g:yankring_manage_numbered_reg = 1
let g:yankring_min_element_length = 2
let g:yankring_max_display = 85
" ,y to show the yankring
nmap <leader>y :YRShow<cr>
" also show with <F5>
nnoremap <silent> <F5> :YRShow<cr>
inoremap <silent> <F5> n_url<ESC>:YRShow<cr>

" open tag in new window
map <C-\> :tab split<CR>:exec("ts ".expand("<cword>"))<CR>

" open up chef file under cursor in a new tab
map <leader>c :tab split<CR>:ChefFindAny<CR>

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

" shift + tab to un-indent
imap <S-Tab> <C-o><<

" find out who's to blame for the current line
vmap <leader>b :<C-U>!svn blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR> 
vmap <leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" strip trailing whitespace
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
function! <SID>StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nmap <silent> <Leader><space> :call <SID>StripTrailingWhitespace()<CR>

" end of line markers
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

"press S to replace the current word with the last-yanked text
map S diw"0P

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" let w!! write a file with root priv
cmap w!! w !sudo tee % >/dev/null

" just command line to open file with ,t
nmap <leader>t <Esc>:tabe 

" use ,W to strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Use v or # to get a variable interpolation (inside of a string)}
" ysiw#   Wrap the token under the cursor in #{}
" v...s#  Wrap the selection in #{}
let g:surround_113 = "#{\r}"   " v
let g:surround_35  = "#{\r}"   " #

" PHP Specific
autocmd FileType php let php_sql_query=1 "sql-syntax highlighting
autocmd FileType php let php_htmlInStrings=1 "highlights html inside of php strings
" automagically folds functions & methods
"autocmd FileType php let php_folding=1

" Perl
let perl_extended_vars=1

"""""""""""""""""
" function keys
"""""""""""""""""

" fuck you, help key.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap ; :


" toggle nerd tree with <F2>
map <F2> :NERDTreeTabsToggle<CR>
map <F3> :TlistToggle<CR>

" ,w to open a split window and switch to it
nnoremap <leader>w <C-w>v<C-w>l
" use <F6> to cycle through split windows
nnoremap <F6> <C-W>w
" <Shift>+<F6> to cycle backwards
nnoremap <S-F6> <C-W>W

" pastetoggle (sane indentation on pastes)
set pastetoggle=<F12> 

" function to loop through a specified path and include each tag file
if has('python3')
function! BuildTagsFromPath()
python3 << EOF
import os
import vim

tags = ''
tagpath = "%s/%s" % (os.environ['HOME'], '.vimtags')

if (os.path.exists(tagpath)):
    for file in os.listdir(tagpath):
        if (file != 'README'):
            tags += "%s/%s," % (tagpath, file)

cmdsettags = "set tags=%s" % tags
vim.command(cmdsettags)
EOF
endfunction

call BuildTagsFromPath()
endif

" ctags force multiple match list
noremap  <C-]>  g<C-]>

" go format
let g:gofmt_command = "goimports"
autocmd BufWritePre *.go Fmt

" ctrl-p
let g:ctrlp_map = '<leader>,'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -i -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

" vim-airline
let g:airline_theme='solarized'
set noshowmode
set ttimeoutlen=10

" gbrowse from fugitive
map <leader>gb :Gbrowse!<cr>
