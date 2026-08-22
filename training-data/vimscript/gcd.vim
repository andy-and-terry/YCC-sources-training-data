function! Gcd(a, b)
  let x = a:a
  let y = a:b
  while y != 0
    let temp = y
    let y = x % y
    let x = temp
  endwhile
  return x
endfunction

echo Gcd(48, 18)
echo Gcd(100, 75)
