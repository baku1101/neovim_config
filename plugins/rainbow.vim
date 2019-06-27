let g:rainbow_active = 1
let g:rainbow_conf = {
   \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
   \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
   \ 'separately': {
   \   'cpp': {
   \     'parentheses': [
   \       'start=/(/ end=/)/ fold',
   \       'start=/\[/ end=/\]/ fold',
   \       'start=/{/ end=/}/ fold',
   \       'start=/\(\(\<operator\>\)\@<!<\)\&[a-zA-Z0-9_]\@<=<\ze[^<]/ end=/>/'] } } }
