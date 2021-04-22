let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
            \ 'runner'    : 'vimproc',
            \ 'runner/vimproc/updatetime' : 60,
            \ 'outputter' : 'error',
            \ 'outputter/error/success' : 'buffer',
            \ 'outputter/error/error'   : 'quickfix',
            \ 'outputter/buffer/split'  : ':rightbelow 8sp',
            \ 'outputter/buffer/close_on_empty' : 1,
            \ 'cpp'  : 'clang++-6.0',
            \ 'py'  : 'python3',
            \ }
"qでquickfixを閉じれるようにする
au FileType qf nnoremap <silent><buffer>q :quit<CR>
"\rで保存してからquickrunを実行する
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>write<CR>gv:QuickRun -mode v<CR>
"\rでquickfixを閉じて、保存してからquickrunを実行する
let g:quickrun_no_default_key_mappings = 1
nnoremap \r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap \r :<C-U>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>
"<C-c> でquickrunを停止
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" LaTeX Quickrun
" https://qiita.com/ssh0/items/e6d7540cd46fac580bc2より
let g:quickrun_config['tex'] = {
\ 'command' : 'latexmk_wrapper',
\ 'outputter' : 'error',
\ 'outputter/error/success' : 'null',
\ 'outputter/error/error' : 'quickfix',
\ 'srcfile' : expand("%s"),
\ 'exec': '%c %s %a %o',
\ 'cmdopt' : '-pv',
\}

" 部分的に選択してコンパイル
" http://auewe.hatenablog.com/entry/2013/12/25/033416 を参考に
let g:quickrun_config.tmptex = {
\   'exec': [
\           'mv %s %a/tmptex.latex',
\           'latexmk -pdfdvi -pv -output-directory=%a %a/tmptex.latex',
\           ],
\   'args' : expand("%:p:h:gs?\\\\?/?"),
\   'outputter' : 'error',
\   'outputter/error/error' : 'quickfix',
\
\   'hook/eval/enable' : 1,
\   'hook/eval/cd' : "%s:r",
\
\   'hook/eval/template' : '\documentclass{jsarticle}'
\                         .'\usepackage[dvipdfmx]{graphicx, hyperref}'
\                         .'\usepackage{float}'
\                         .'\usepackage{amsmath,amssymb,amsthm,ascmac,mathrsfs}'
\                         .'\allowdisplaybreaks[1]'
\                         .'\theoremstyle{definition}'
\                         .'\newtheorem{theorem}{定理}'
\                         .'\newtheorem*{theorem*}{定理}'
\                         .'\newtheorem{definition}[theorem]{定義}'
\                         .'\newtheorem*{definition*}{定義}'
\                         .'\renewcommand\vector[1]{\mbox{\boldmath{\(#1\)}} }'
\                         .'\begin{document}'
\                         .'%s'
\                         .'\end{document}',
\
\   'hook/sweep/files' : [
\                        '%a/tmptex.aux',
\                        '%a/tmptex.dvi',
\                        '%a/tmptex.fdb_latexmk',
\                        '%a/tmptex.fls',
\                        '%a/tmptex.latex',
\                        '%a/tmptex.log',
\                        '%a/tmptex.out',
\                        ],
\}

vnoremap <silent><buffer> <F6> :QuickRun -mode v -type tmptex<CR>

" QuickRun and view compile result quickly
nnoremap <silent><F6> :QuickRun<CR>

"c++のコンパイル設定
" let g:quickrun_config.cpp.type = 'cpp/clang++'
"if executable("clang++-6.0")
"  let g:syntastic_cpp_compiler = 'clang++-6.0'
"  let g:syntastic_cpp_compiler_options = '--std=c++14 --stdlib=libc++'
"  let g:quickrun_config = {}
"  let g:quickrun_config['cpp/clang++-6.0'] = {
"      \ 'cmdopt': '--std=c++14 --stdlib=libc++',
"      \ 'type': 'cpp/clang++'
"    \ }
"  let g:quickrun_config['cpp'] = {'type': 'cpp/clang++-6.0'}
"endif
