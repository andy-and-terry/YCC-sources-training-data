function! Ordinal(n) abort
  let r100 = a:n % 100
  if r100 >= 11 && r100 <= 13
    return a:n . 'th'
  endif
  let suffixes = {1: 'st', 2: 'nd', 3: 'rd'}
  return a:n . get(suffixes, a:n % 10, 'th')
endfunction

echo join(map([1, 2, 3, 4, 11, 12, 13, 21, 101, 111], {_, n -> Ordinal(n)}), ' ')
