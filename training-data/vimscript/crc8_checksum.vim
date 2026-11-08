function! Crc8(s) abort
  let crc = 0
  for ch in split(a:s, '\zs')
    let crc = xor(crc, char2nr(ch))
    for i in range(8)
      if and(crc, 128)
        let crc = and(xor(crc * 2, 7), 255)
      else
        let crc = and(crc * 2, 255)
      endif
    endfor
  endfor
  return crc
endfunction

echo printf('%02x', Crc8('123456789'))
