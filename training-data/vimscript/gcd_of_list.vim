function! Gcd(a, b) abort
  let [a, b] = [a:a, a:b]
  while b != 0
    let [a, b] = [b, a % b]
  endwhile
  return abs(a)
endfunction

function! GcdAll(nums) abort
  return reduce(a:nums, {acc, n -> Gcd(acc, n)}, 0)
endfunction

echo GcdAll([12, 18, 24])
echo GcdAll([7, 13])
