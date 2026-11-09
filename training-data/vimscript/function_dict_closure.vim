function! MakeCounter() abort
  let l:state = {'n': 0}
  function! l:state.inc() abort
    let self.n += 1
    return self.n
  endfunction
  return l:state
endfunction

let s:c = MakeCounter()
call s:c.inc()
echo s:c.inc()
