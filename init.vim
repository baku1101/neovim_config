" 基本設定 {{{1
" モードラインを有効にする
set modeline
" 3行目までをモードラインとして検索する
set modelines=3

"文字コード設定 utf-8"
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
" 一部の全角記号の崩れを解決
set ambiwidth=double
"クリップボードをOSと共有
set clipboard=unnamed,unnamedplus
" バックアップファイルを作らない
" set nobackup
set iminsert=0 imsearch=0
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 改行の自動コメントアウトの無効化
set formatoptions-=o
set formatoptions-=r
"set guicursor=1
" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" カーソルの飛ぶ時間:0.1s
set matchtime=1
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=longest:full,full
" 自動で折りたたまないようにする
let g:vim_markdown_folding_disabled=1

if has('vim_starting')
    let &t_SI .= "\e[6 q"
    let &t_EI .= "\e[2 q"
    let &t_SR .= "\e[4 q"
endif

" Tab系
" 不可視文字を可視化(タブが「?-」と表示される) →  indentLineというプラグインを使う
" set list listchars=tab:\?\-
" Tab文字を半角スペースにする
" set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 検索のハイライトの配色変更
highlight Search ctermfg=4 cterm=reverse
" begin end などを%で移動できるようにする(%の拡張)
source $VIMRUNTIME/macros/matchit.vim

" floatwindowを半透明にする
set winblend=10
" ポップアップを半透明にする
set pumblend=10
" コマンドラインの補完もポップアップにする
set wildoptions=pum

" }}}1
" プラグイン {{{1

"dein.vim(プラグイン管理)の設定
"deinパス設定
let s:dein_dir = fnamemodify('~/.config/nvim/dein/', ':p') "<-お好きな場所
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim' "<-固定

" dein.vim本体の存在チェックとインストール
if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' shellescape(s:dein_repo_dir)
endif

" dein.vim本体をランタイムパスに追加
if &runtimepath !~# '/dein.vim'
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" 必須
call dein#begin(s:dein_dir)

" Plugins
call dein#add('Shougo/vimproc.vim', {'build' : 'make -f make_unix.mak'})
call dein#add('flazz/vim-colorschemes')
call dein#add('jacoborus/tender.vim')
call dein#add('gosukiwi/vim-atom-dark')

call dein#load_toml('~/.config/nvim/dein/dein.toml', {'lazy': 0})
call dein#load_toml('~/.config/nvim/dein/dein_lazy.toml', {'lazy': 1})

" 必須
call dein#end()
filetype plugin indent on
syntax enable

" プラグインのインストール
if dein#check_install()
    call dein#install()
endif

"}}}1
" カラースキーム {{{1
"colorscheme設定
if (has("termguicolors"))
    set termguicolors
endif
let g:cpp_class_scope_highlight = 1
colorscheme atom-dark-256

highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight CursorLine guifg=none
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
let g:seiya_auto_enable=0
"}}}1
" キーマッピング {{{1
" from Shougo's mapping
" [Space]: Other useful commands
" Smart space mapping.
nmap  <Space> [Space]
" s: Windows and buffers(High priority)
nmap    s [Window]
" The prefix key.
nmap    t [Tag]

" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>

noremap j gj
noremap k gk
noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
noremap m  %
nnoremap <CR> o<ESC>
nnoremap <S-CR> O<ESC>
nnoremap == gg=G''
nnoremap <Space>n  :NERDTree<CR>
nnoremap <Space>tv  :vs<CR>:Deol<CR>
nnoremap <Space>ts  :sp<CR>:Deol<CR>
nnoremap <Space>tf  :Deol -split=floating -winwidth=110<CR>
nnoremap < <<
nnoremap > >>
noremap ; :
noremap : ;
nnoremap <Space> i<Space><Esc>l
inoremap <C-b> //============================================================================================<CR><C-u>
nnoremap <Space>b i//============================================================================================<CR><C-u><C-[>
set backspace=start,eol,indent
set wildmenu
inoremap jk <Esc>
cnoremap Se SeiyaEnable
cnoremap Sd SeiyaDisable
tnoremap <C-[> <C-\><C-n>
" xで消した文字をレジスタに残さない
nnoremap x "_x
nnoremap X "_X

" visual + C-nで改行削除 つかってない
" vnoremap <C-n> :s/\n/ /g<CR>
"
nnoremap <silent> <C-p> :PrevimOpen<CR>
"jq用の設定
command! -nargs=? Jq call s:Jq(<f-args>)
function! s:Jq(...)
	if 0 == a:0
		let l:arg = "."
	else
		let l:arg = a:1
	endif
	execute "%! jq \"" . l:arg . "\""
endfunction

autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

"}}}1
" テンプレートファイル {{{1
"import template file
autocmd BufNewFile *.sh 0r ~/.config/nvim/template/sh.txt
autocmd BufNewFile *.cpp 0r ~/.config/nvim/template/cpp.txt
"}}}1
" プラグインの設定類 そのうち移行したい {{{1
" 未使用 {{{2
"============================================================================================
"manの設定
"autocmd FileType cpp set keywordprg=:term\ cppman
"Shift-kでカーソル下の単語を検索してくれるけどうまく行っていない

"============================================================================================
"twitvimの設定
"let twitvim_enable_python3 = 1
"let twitvim_force_ssl = 1
"let twitvim_count = 100
"tweetvimを使うことにした

"============================================================================================
""syntasticの設定 もう使ってない
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_cpp_check_header = 1
""let g:syntastic_cpp_checkers = ['gcc']
"let g:syntastic_cpp_checkers = ['clang_check']
"let g:syntastic_cpp_clang_check_args = '-extra-arg=-std=c++14'
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++14 -stdlib=libc++'
""let g:syntastic_clang_check_config_file=1

"============================================================================================
"tweetvimの設定
"" タイムライン選択用の Unite を起動する
"nnoremap <silent> <Space>tt :Unite tweetvim<CR>
"" 発言用バッファを表示する
"nnoremap <silent> <Space>s :<C-u>TweetVimSay<CR>
"" mentions を表示する
"nnoremap <silent> <Space>re :<C-u>TweetVimMentions<CR>
"" 特定のリストのタイムラインを表示する
"" nnoremap <silent> <Space>tt :<C-u>TweetVimListStatuses basyura vim<CR>
"
"" スクリーン名のキャッシュを利用して、neocomplcache で補完する
"if !exists('g:neocomplcache_dictionary_filetype_lists')
"    let g:neocomplcache_dictionary_filetype_lists = {}
"endif
"let neco_dic = g:neocomplcache_dictionary_filetype_lists
"let neco_dic.tweetvim_say = $HOME . '/.tweetvim/screen_name'

"}}}2
"使用中 {{{2
"texのための設定 {{{3
" autocmd
"==============================
augroup filetype
  autocmd!
  " tex file (I always use latex)
  autocmd BufRead,BufNewFile *.tex set filetype=tex
augroup END

" disable the conceal function
let g:tex_conceal=''
"translate設定 {{{3
command! -nargs=+ Trans :vs | :term trans <args>
"複数行はできなかった！(改行が入ってしまう)
"普通に辞書として使いたいときはF2(英語→ 日本語)
nnoremap <F2> yw :Trans '<C-r>"'<CR>
vnoremap <F2> y :Trans '<C-r>"'<CR>

"日本語→ 英語はF3
nnoremap <F3> yw :Trans :en '<C-r>"'<CR>
vnoremap <F3> y :Trans :en '<C-r>"'<CR>

"F4でその行を変換(日本語→ 英語)
let s:trans_cmd = 'trans'
let s:trans_opt = ':en -b --no-ansi -e google'
exec 'command! -nargs=0 -range TransLine <line1>,<line2>!' . s:trans_cmd . ' ' . s:trans_opt
nnoremap <silent> <F4> :TransLine<CR>
"}}}3
"vimのtab機能をいい感じにする {{{3
" Anywhere SID.
function! s:SID_PREFIX()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
    let s = ''
    for i in range(1, tabpagenr('$'))
        let bufnrs = tabpagebuflist(i)
        let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
        let no = i  " display 0-origin tabpagenr.
        let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
        let title = fnamemodify(bufname(bufnr), ':t')
        let title = '[' . title . ']'
        let s .= '%'.i.'T'
        let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
        let s .= no . ':' . title
        let s .= mod
        let s .= '%#TabLineFill# '
    endfor
    let s .= '%#TabLineFill#%T%=%#TabLine#'
    return s
endfunction
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 "常にタブラインを表示

" Tab jump
" t1で1番左のタブ、t2で1番左から2番目のタブにジャンプ
for n in range(1, 9)
    execute 'nnoremap<silent> [Tag]'.n	':<C-u>tabnext'.n.'<CR>'
endfor
" tc 新しいタブを一番右に作る
nnoremap <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx タブを閉じる
nnoremap <silent> [Tag]x :tabclose<CR>
" tn 次のタブ
nnoremap <silent> [Tag]n :tabnext<CR>
" tp 前のタブ
nnoremap <silent> [Tag]p :tabprevious<CR>
" }}}3
"}}}2
"}}}1

" この折りたたみはmarkerという機能を使用している za:折りたたみの開閉 zA:折りたたみの再帰的開閉
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
