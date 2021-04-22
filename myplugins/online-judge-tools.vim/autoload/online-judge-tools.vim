fun! s:oj(...)
	if a:0 == 0
		echo system('oj')
	elseif a:1 == 'd'
		echo system('oj ' . a:1 . ' ' . a:2)
	endif
endf

command! -nargs=* Oj call s:oj(<f-args>)
