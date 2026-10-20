augroup trim_ws
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e
augroup END
