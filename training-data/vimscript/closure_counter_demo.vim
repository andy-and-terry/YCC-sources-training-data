function! s:MakeCounter(start)
  let l:count = a:start
  function! s:CounterStep() closure
    let l:count += 1
    return l:count
  endfunction
  return function('s:CounterStep')
endfunction

let Counter = s:MakeCounter(10)
echo Counter()
echo Counter()
echo Counter()
