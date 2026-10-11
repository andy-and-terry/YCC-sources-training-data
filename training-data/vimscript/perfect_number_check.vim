" A perfect number equals the sum of its proper divisors.
function! s:IsPerfect(n) abort
  if a:n < 2 | return 0 | endif
  let l:sum = 1
  let l:i = 2
  while l:i * l:i <= a:n
    if a:n % l:i == 0
      let l:sum += l:i
      if l:i != a:n / l:i
        let l:sum += a:n / l:i
      endif
    endif
    let l:i += 1
  endwhile
  return l:sum == a:n
endfunction
echo filter(range(1, 500), {_, v -> s:IsPerfect(v)})
