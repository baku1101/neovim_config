set hidden

let g:LanguageClient_serverCommands = {}

"===cppのためのcompile.jsonの設定
function s:Make_compile_commands_cpp()
  let temp = expand('%')
  let dir = getcwd()
  echo system('echo ''[{"directory": "' . dir . '","file": "' . temp . '", "arguments": ["/usr/bin/clang", "-xc++", "' . temp . '", "--driver-mode=g++", "-std=c++14", "-Wall", "-Wno-unused-const-variable", "-g", "-fsanitize=undefined", "-D", "_GLIBCXX_DEBUG", "--target=x86_64-pc-linux-gnu"]}]'' > compile_commands.json')
endfunction
function s:Make_compile_commands_c()
  let temp = expand('%')
  let dir = getcwd()
  echo system('echo ''[{"directory": "' . dir . '","file": "' . temp . '", "arguments": ["/usr/bin/clang", "' . temp . '", "-std=c11", "-Wall", "-Wno-unused-const-variable", "-g", "-fsanitize=undefined", "-D", "_GLIBCXX_DEBUG", "--target=x86_64-pc-linux-gnu"]}]'' > compile_commands.json')
endfunction
autocmd BufRead,BufNewFile *.cpp call s:Make_compile_commands_cpp()
autocmd BufRead,BufNewFile *.c call s:Make_compile_commands_c()

" 言語ごとに設定する
" cpp:
"   compile_comand.jsonファイルがあればそれを読み出す(makefileからリンク情報を読み出したものが入っているから
"   それで別ファイル参照も可能になる
let g:LanguageClient_serverCommands = {
    \'rust': ['rustup', 'run', 'stable', 'rls'],
    \'python': ['pyls'],
    \'cs': ['/home/watanabe/.omnisharp/omnisharp-roslyn/run', '-d'],
    \'cpp': ['cquery',
        \ '--language-server',
        \ '--log-file=/tmp/cq.log',
        \ '--init={"cacheDirectory":"/var/cquery/"}'],
    \'c'  : ['cquery',
        \ '--language-server',
        \ '--log-file=/tmp/cq.log',
        \ '--init={"cacheDirectory":"/var/cquery/"}'],
	\'ruby': ['solargraph', 'stdio'],
	\'scala': ['metals-vim', '--Log_level=Log']
    \ }

"    cquery向けのcppの設定
"    重くてだめになったし、clangdでも別ファイル参照できたからボツ
"    \ 'cpp': ['cquery',
"        \ '--language-server',
"        \ '--log-file=/tmp/cq.log',
"        \ '--init={"cacheDirectory":"/var/cquery/"}'],
    "\'cpp': ['clangd-6.0', '-compile-commands-dir=' . getcwd()],

let g:LanguageClient_loggingLevel = 'DEBUG'

augroup LanguageClient_config
    autocmd!
    autocmd User LanguageClientStarted setlocal signcolumn=yes
    autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
nnoremap <Leader>lh :call LanguageClient_textDocument_hover()<CR>
nnoremap <Leader>ld :call LanguageClient_textDocument_definition()<CR>
nnoremap <Leader>lr :call LanguageClient_textDocument_rename()<CR>
nnoremap <Leader>lf :call LanguageClient_textDocument_formatting()<CR>
nnoremap <silent> gr :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<CR>

let g:OmniSharp_selector_ui = ''

