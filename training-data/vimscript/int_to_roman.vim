" Integer (1..3999) to Roman numeral using a greedy table.
let s:table = [
      \ [1000, 'M'], [900, 'CM'], [500, 'D'], [400, 'CD'], [100, 'C'], [90, 'XC'],
      \ [50, 'L'], [40, 'XL'], [10, 'X'], [9, 'IX'], [5, 'V'], [4, 'IV'], [1, 'I']]

function! ToRoman(n) abort
  let l:n = a:n
  let l:out = ''
  for [l:value, l:symbol] in s:table
    while l:n >= l:value
      let l:out .= l:symbol
      let l:n -= l:value
    endwhile
  endfor
  return l:out
endfunction

echo ToRoman(1994) ToRoman(58)
