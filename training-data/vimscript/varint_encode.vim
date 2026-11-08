function! Varint(n) abort
  let n = a:n
  let out = []
  while n >= 128
    call add(out, or(n % 128, 128))
    let n = n / 128
  endwhile
  call add(out, n)
  return out
endfunction

echo map(Varint(300), 'printf("%02x", v:val)')
