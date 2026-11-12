function! s:Make(n) abort
  let obj = {'n': a:n}
  function! obj.inc() dict abort
    let self.n += 1
    return self.n
  endfunction
  return obj
endfunction
let c = s:Make(1)
call c.inc()
echo c.inc()
