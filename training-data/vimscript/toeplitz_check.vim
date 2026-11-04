function! IsToeplitz(m) abort
  for i in range(1, len(a:m) - 1)
    for j in range(1, len(a:m[i]) - 1)
      if a:m[i][j] != a:m[i - 1][j - 1]
        return 0
      endif
    endfor
  endfor
  return 1
endfunction

echo IsToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]])
echo IsToeplitz([[1, 2], [2, 2]])
