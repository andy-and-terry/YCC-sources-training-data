function! ToRoman(n)
  let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let symbols = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I']
  let result = ''
  let remaining = a:n
  for i in range(len(values))
    while remaining >= values[i]
      let result .= symbols[i]
      let remaining -= values[i]
    endwhile
  endfor
  return result
endfunction

echo ToRoman(1994)
