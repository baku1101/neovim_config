augroup filetype
	au!
	au BufRead,BufNewFile *.tex set filetype=tex
	au BufNewFile,BufRead *.vt		setf verilog
	au BufNewFile,BufRead *.nvim	setf vim
	au BufRead,BufNewFile *.mkd  	setf markdown
	au BufRead,BufNewFile *.md  	setf markdown
	au BufRead,BufNewFile *.sbt  	setf scala
augroup END
