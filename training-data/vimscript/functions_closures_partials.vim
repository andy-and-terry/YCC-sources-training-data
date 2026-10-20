function! Add(a, b) abort
  return a:a + a:b
endfunction
function! Greet(name, ...) abort
  let greeting = a:0 > 0 ? a:1 : 'Hello'
  return greeting . ', ' . a:name . ' (' . a:0 . ' extra)'
endfunction
function! Sum(...) abort
  let total = 0
  for n in a:000 | let total += n | endfor
  return total
endfunction
echo Add(2, 3) Greet('Ada') Greet('Bo', 'Hi') Sum(1, 2, 3, 4)
let Inc = function('Add', [1])
echo Inc(41)
let Dbl = {x -> x * 2}
echo Dbl(21) map([1, 2, 3], {_, v -> v * 2})
function! MakeCounter() abort
  let state = {'n': 0}
  function! state.inc() abort dict
    let self.n += 1
    return self.n
  endfunction
  return state
endfunction
let c = MakeCounter()
call c.inc() | call c.inc()
echo c.n c.inc()
echo call('Add', [10, 20]) exists('*Add') exists('*Nope')
let Fn = funcref('Add')
echo Fn(1, 1) type(Fn) == v:t_func
