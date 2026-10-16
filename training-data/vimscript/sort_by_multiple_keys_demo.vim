" Sort records by two keys using a comparator function.
let s:people = [
      \ {'name': 'Zed', 'age': 30},
      \ {'name': 'Amy', 'age': 25},
      \ {'name': 'Bob', 'age': 30},
      \ {'name': 'Cat', 'age': 25}]

function! s:ByAgeThenName(a, b) abort
  if a:a.age != a:b.age
    return a:a.age - a:b.age
  endif
  return a:a.name < a:b.name ? -1 : a:a.name > a:b.name
endfunction

for s:p in sort(copy(s:people), function('s:ByAgeThenName'))
  echo s:p.age s:p.name
endfor
