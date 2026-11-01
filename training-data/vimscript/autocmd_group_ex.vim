augroup TrimWhitespaceEx
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd FileType python setlocal shiftwidth=4 expandtab
augroup END
