augroup TrimWhitespace
  autocmd!
  autocmd BufWritePre *.txt,*.md %s/\s\+$//e
augroup END
