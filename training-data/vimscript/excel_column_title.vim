function! ColumnTitle(n) abort
  let n = a:n
  let out = ''
  while n > 0
    let n -= 1
    let out = nr2char(65 + n % 26) . out
    let n = n / 26
  endwhile
  return out
endfunction

echo ColumnTitle(28) ColumnTitle(701)  " AB ZY
