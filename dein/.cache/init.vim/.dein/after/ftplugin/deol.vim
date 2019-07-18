if exists('b:undo_ftplugin')
  let b:undo_ftplugin .= '|'
else
  let b:undo_ftplugin = ''
endif
nnoremap <buffer><silent> [Space]gc :<C-u>call deol#send('git commit')<CR>
nnoremap <buffer><silent> [Space]gA :<C-u>call deol#send('git commit --amend')<CR>
