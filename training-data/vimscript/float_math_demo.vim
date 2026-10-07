echo 7 / 2
echo 7 / 2.0
echo 7 % 3
echo -7 % 3
echo 2 * 3.5
echo string(sqrt(16.0))
echo string(pow(2, 10))
echo string(2.0 * 3)
echo string(abs(-4.5))
echo string(floor(3.7)) . ' ' . string(ceil(3.2)) . ' ' . string(round(3.5)) . ' ' . string(trunc(-3.7))
echo float2nr(floor(3.7))
echo printf('%.4f', atan(1.0) * 4)
echo printf('%.4f', sin(0.0)) . ' ' . printf('%.4f', cos(0.0))
echo printf('%.4f', log(exp(1.0)))
echo printf('%.2f', log10(1000.0))
echo fmod(10.0, 3.0)
echo 1.5e3
echo 1.0 / 3.0 < 0.34
echo isnan(0.0 / 0.0)
echo isinf(1.0 / 0.0)
echo max([3, 9, 2]) . ' ' . min([3, 9, 2])
echo abs(-7)
echo 0x1F + 0b101 + 017
echo and(12, 10) . ' ' . or(12, 10) . ' ' . xor(12, 10) . ' ' . invert(0)
echo 1 << 4
echo 256 / 16
function! s:Average(xs) abort
  let l:total = 0.0
  for l:x in a:xs
    let l:total += l:x
  endfor
  return l:total / len(a:xs)
endfunction
echo printf('%.2f', s:Average([1, 2, 3, 4]))
