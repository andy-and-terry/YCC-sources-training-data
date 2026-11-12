augroup MyGroup
  autocmd!
  autocmd BufWritePre *.txt echo 'saving'
augroup END
