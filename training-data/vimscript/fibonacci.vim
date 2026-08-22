function! Fibonacci(n)
  let result = []
  let a = 0
  let b = 1
  for i in range(a:n)
    call add(result, a)
    let temp = a + b
    let a = b
    let b = temp
  endfor
  return result
endfunction

echo Fibonacci(11)
