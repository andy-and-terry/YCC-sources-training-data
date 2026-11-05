augroup MyFiletypes
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 expandtab
  autocmd FileType go setlocal noexpandtab tabstop=4
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
