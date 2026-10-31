function! Cullen(n)
  return a:n * float2nr(pow(2, a:n)) + 1
endfunction

for n in range(1, 5)
  echo n Cullen(n)
endfor
