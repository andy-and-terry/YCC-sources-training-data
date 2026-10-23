let s:counter = {'n': 0}

function! s:counter.inc() dict
  let self.n += 1
  return self.n
endfunction

call s:counter.inc()
call s:counter.inc()
echo 'count = ' . s:counter.n
