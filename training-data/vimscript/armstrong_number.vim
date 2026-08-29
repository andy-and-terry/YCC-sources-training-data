function! IsArmstrong(n)
  let digitsStr = string(a:n)
  let power = len(digitsStr)
  let total = 0
  for c in split(digitsStr, '\zs')
    let total += float2nr(pow(str2nr(c), power))
  endfor
  return total == a:n
endfunction

echo IsArmstrong(153)
echo IsArmstrong(154)
