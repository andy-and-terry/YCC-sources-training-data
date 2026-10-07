let g:insert_enters = 0
let g:insert_leaves = 0

augroup InsertModeTracker
  autocmd!
  autocmd InsertEnter * let g:insert_enters += 1
  autocmd InsertLeave * let g:insert_leaves += 1
augroup END

doautocmd InsertEnter
doautocmd InsertLeave
doautocmd InsertEnter
doautocmd InsertLeave

echo g:insert_enters
echo g:insert_leaves
