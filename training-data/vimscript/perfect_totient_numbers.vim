" Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
function! Gcd(a, b)
  let l:a = a:a
  let l:b = a:b
  while l:b != 0
    let [l:a, l:b] = [l:b, l:a % l:b]
  endwhile
  return l:a
endfunction

function! Phi(n)
  let l:c = 0
  for l:k in range(1, a:n)
    if Gcd(l:k, a:n) == 1
      let l:c += 1
    endif
  endfor
  return l:c
endfunction

function! ChainSum(n)
  let l:m = a:n
  let l:total = 0
  while l:m > 1
    let l:m = Phi(l:m)
    let l:total += l:m
  endwhile
  return l:total
endfunction

echo join(filter(range(2, 199), 'ChainSum(v:val) == v:val'), ' ')
