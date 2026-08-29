let g:save_count = 0

augroup MyAutoCmds
  autocmd!
  autocmd BufWritePre * let g:save_count += 1
augroup END

echo 'autocmd group registered: MyAutoCmds tracks BufWritePre events'
