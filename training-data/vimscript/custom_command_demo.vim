function! SumNumbers(...)
  let total = 0
  for n in a:000
    let total += str2nr(n)
  endfor
  return total
endfunction

command! -nargs=1 Greet echo 'Hello, ' . <q-args> . '!'
command! -nargs=* SumArgs echo SumNumbers(<f-args>)

Greet World
SumArgs 1 2 3
