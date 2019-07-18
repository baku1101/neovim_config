if !has('patch-7.4.480')
    " Before this patch, vim used modula2 for .md.
    au! filetypedetect BufRead,BufNewFile *.md
endif

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} setfiletype markdown
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}.{des3,des,bf,bfa,aes,idea,cast,rc2,rc4,rc5,desx} setfiletype markdown
autocmd BufReadPost,BufNewFile .themisrc setfiletype vim
autocmd BufReadPost,BufNewFile *.vimspec setfiletype vimspec

au BufRead,BufNewFile lit.*cfg set filetype=python
au BufRead,BufNewFile *.ll set filetype=llvm
au BufRead,BufNewFile *.td set filetype=tablegen
" vint: -ProhibitAutocmdWithNoGroup

autocmd BufRead,BufNewFile *.rs call s:set_rust_filetype()
autocmd BufRead,BufNewFile Cargo.toml setf FALLBACK cfg

function! s:set_rust_filetype() abort
    if &filetype !=# 'rust'
        set filetype=rust
    endif
endfunction

" vim: set et sw=4 sts=4 ts=8:
" Detect syntax file.
autocmd BufNewFile,BufRead *.snip,*.snippets set filetype=neosnippet
" Go dep and Rust use several TOML config files that are not named with .toml.
autocmd BufNewFile,BufRead *.toml,Gopkg.lock,Cargo.lock,*/.cargo/config,*/.cargo/credentials,Pipfile setf toml
autocmd BufNewFile,BufRead *.json setlocal filetype=json
autocmd BufNewFile,BufRead *.jsonl setlocal filetype=json
autocmd BufNewFile,BufRead *.jsonp setlocal filetype=json
autocmd BufNewFile,BufRead *.geojson setlocal filetype=json
autocmd BufNewFile,BufRead *.template setlocal filetype=json
