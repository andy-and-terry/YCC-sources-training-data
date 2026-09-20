let g:fired = 0

function! OnTimer(id)
  let g:fired += 1
endfunction

let g:timer_id = timer_start(10, 'OnTimer')
sleep 100m
echo 'fired: ' . g:fired
