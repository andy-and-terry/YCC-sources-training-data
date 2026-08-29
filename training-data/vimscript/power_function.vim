function! MyPower(base, exp)
  if a:exp == 0
    return 1
  endif
  if a:exp % 2 == 0
    let half = MyPower(a:base, a:exp / 2)
    return half * half
  endif
  return a:base * MyPower(a:base, a:exp - 1)
endfunction

echo MyPower(2, 10)
echo MyPower(3, 5)
