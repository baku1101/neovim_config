" <Space>dy: ヤンクの履歴
nnoremap <silent> <Space>dy
	\ :<C-u>Denite -buffer-name=register
	\ register neoyank<CR>
xnoremap <silent> <Space>dy
	\ :<C-u>Denite -default-action=replace -buffer-name=register
	\ register neoyank<CR>
" s<space>: neovimの設定ファイルに飛べる
nnoremap <silent> [Window]<Space>
	\ :<C-u>Denite file/rec:~/.config/nvim/<CR>
" /,n,*でのサーチにdeniteを使用
"nnoremap <expr> / line('$') > 10000 ? '/' :
"\ ":\<C-u>Denite -buffer-name=search -start-filter line\<CR>"
"nnoremap <expr> n line('$') > 10000 ? 'n' :
"\ ":\<C-u>Denite -buffer-name=search -resume -refresh -no-start-filter\<CR>"
"nnoremap <expr> * line('$') > 10000 ? '*' :
"\ ":\<C-u>DeniteCursorWord -buffer-name=search line\<CR>"
" ss: カレントディレクトリのファイルを見る?
nnoremap <silent> [Window]s :<C-u>Denite file/point file/old
	\ -sorters=sorter/rank
	\ `finddir('.git', ';') != '' ? 'file/rec/git' : 'file/rec'`
	\ file file:new<CR>
" sn: neovimのプラグインのリポジトリ管理?
nnoremap <silent> [Window]n :<C-u>Denite dein<CR>
nnoremap <silent> [Window]b :<C-u>Denite buffer<CR>
" nnoremap <silent> [Window]g :<C-u>Denite ghq<CR>
" <Space>dg: カレントディレクトリ以下をripgrep
nnoremap <silent> <Space>dg :<C-u>Denite -buffer-name=search
	\ -no-empty grep<CR>
" nnoremap <silent> ft :<C-u>Denite filetype<CR>
" nnoremap <silent> <C-t> :<C-u>Denite
"	\ -cursor-pos=`tabpagenr()-1` deol:zsh<CR>
nnoremap <silent> <Space>dc :<C-u>Denite change jump<CR>
nnoremap <silent> <Space>dh :<C-u>DeniteCursorWord help<CR>
nnoremap <silent> <Space>db :<C-u>Denite buffer<CR>
nnoremap <silent> <Space>gs :<C-u>Denite gitstatus<CR>
nnoremap <silent> <Space>gl :<C-u>Denite gitlog<CR>
nnoremap <silent> <Space>gf :<C-u>Denite gitfiles<CR>
nnoremap <silent> <Space>gb :<C-u>Denite gitbranch<CR>
nnoremap <silent> <Space>gc :<C-u>Denite gitchanged<CR>
" nnoremap <silent> ,,
" 	\ :<C-u>Denite command command_history<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
