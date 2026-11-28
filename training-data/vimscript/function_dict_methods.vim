function! MakeCounter() abort
  let l:c = {'n': 0}
  function! l:c.inc() dict
    let self.n += 1
    return self.n
  endfunction
  return l:c
endfunction

let s:c = MakeCounter()
call s:c.inc()
echo s:c.inc()
