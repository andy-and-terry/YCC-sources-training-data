" Ways to write n as a sum of two or more consecutive positive integers.
function! PoliteWays(n)
  let l:ways = 0
  let l:k = 2
  while l:k * (l:k + 1) / 2 <= a:n
    if (a:n - l:k * (l:k - 1) / 2) % l:k == 0
      let l:ways += 1
    endif
    let l:k += 1
  endwhile
  return l:ways
endfunction

echo join(map(range(1, 16), 'PoliteWays(v:val)'), ' ')
