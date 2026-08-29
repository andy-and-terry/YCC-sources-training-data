function! MyGcd(a, b)
  let a = a:a
  let b = a:b
  while b != 0
    let t = b
    let b = a % b
    let a = t
  endwhile
  return abs(a)
endfunction

function! MyLcm(a, b)
  return abs(a:a * a:b) / MyGcd(a:a, a:b)
endfunction

echo MyGcd(48, 18)
echo MyLcm(4, 6)
