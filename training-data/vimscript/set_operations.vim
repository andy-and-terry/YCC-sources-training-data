function! ListToSet(lst)
  let s = {}
  for v in a:lst
    let s[v] = 1
  endfor
  return s
endfunction

function! SetUnion(a, b)
  return sort(keys(extend(copy(a:a), a:b)))
endfunction

function! SetIntersection(a, b)
  return sort(filter(keys(a:a), 'has_key(a:b, v:val)'))
endfunction

function! SetDifference(a, b)
  return sort(filter(keys(a:a), '!has_key(a:b, v:val)'))
endfunction

let setA = ListToSet([1, 2, 3, 4])
let setB = ListToSet([3, 4, 5, 6])

echo SetUnion(setA, setB)
echo SetIntersection(setA, setB)
echo SetDifference(setA, setB)
