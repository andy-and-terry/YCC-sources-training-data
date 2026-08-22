function! IsPrime(n)
  if a:n < 2
    return v:false
  endif
  let i = 2
  while i * i <= a:n
    if a:n % i == 0
      return v:false
    endif
    let i += 1
  endwhile
  return v:true
endfunction

echo IsPrime(17)
