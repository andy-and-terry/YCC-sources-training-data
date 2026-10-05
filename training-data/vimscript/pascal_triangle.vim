function! PascalRow(n)
  let row = [1]
  for i in range(1, a:n)
    let next = [1]
    for j in range(1, i - 1)
      call add(next, row[j - 1] + row[j])
    endfor
    call add(next, 1)
    let row = next
  endfor
  return row
endfunction

for r in range(0, 5)
  echo join(PascalRow(r), ' ')
endfor
