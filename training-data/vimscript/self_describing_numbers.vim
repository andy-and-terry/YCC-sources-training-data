function! IsSelfDescribing(s)
  let digits = map(split(a:s, '\zs'), 'str2nr(v:val)')
  for i in range(len(digits))
    let count = len(filter(copy(digits), 'v:val == ' . i))
    if count != digits[i]
      return 0
    endif
  endfor
  return 1
endfunction

for s in ['1210', '2020', '21200', '1211']
  echo s IsSelfDescribing(s)
endfor
