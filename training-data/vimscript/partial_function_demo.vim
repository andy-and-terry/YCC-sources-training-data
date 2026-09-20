function! Multiply(a, b)
  return a:a * a:b
endfunction

let Double = function('Multiply', [2])
let Triple = function('Multiply', [3])

echo Double(5)
echo Triple(5)

function! Greet(greeting, name)
  return a:greeting . ', ' . a:name . '!'
endfunction

let Hello = function('Greet', ['Hello'])
echo Hello('World')
