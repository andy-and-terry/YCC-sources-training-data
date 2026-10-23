function! NewCounter(start) abort
  let obj = {'value': a:start}
  function! obj.increment() abort dict
    let self.value += 1
    return self
  endfunction
  function! obj.show() abort dict
    echo 'counter =' self.value
  endfunction
  return obj
endfunction

let c = NewCounter(10)
call c.increment().increment().increment()
call c.show()
