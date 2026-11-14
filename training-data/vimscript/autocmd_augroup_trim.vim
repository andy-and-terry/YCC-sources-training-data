augroup TrimWhitespace
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END
