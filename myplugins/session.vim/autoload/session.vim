" 現在のパスからパスセパレータを取得

let s:sep = fnamemodify('.', ':p')[-1:]

function! session#create_session(file) abort
	" SessionCreateの引数をfileで受け取れるようにする
	" join()でセッションファイル保存先へのフルパスを生成し，mksession!でセッションファイルを作成する
	execute 'mksession!' join([g:session_path, a:file], s:sep)
	" redrawで画面を再描画
	redraw
	echo "session.vim: created"
endfunction
