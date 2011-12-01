let g:alternateExtensions_m = "h"
let g:alternateExtensions_h = "m"
" turn off the whitespace highlighting
highlight clear EOLWS
" obj-c stuff (also objc in dotvim/ftplugin/objc.vim)
map <leader>s :A<CR>
map <leader>l :ListMethods<CR>
map <leader>d :CocoaDoc 
let tlist_objc_settings    = 'objc;i:interface;c:class;m:method;p:property'
