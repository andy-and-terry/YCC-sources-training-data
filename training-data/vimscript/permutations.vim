function! Permute(items, current, result)
  if empty(a:items)
    call add(a:result, a:current)
    return
  endif
  for i in range(len(a:items))
    let remaining = copy(a:items)
    let picked = remove(remaining, i)
    call Permute(remaining, a:current + [picked], a:result)
  endfor
endfunction

function! Permutations(items)
  let result = []
  call Permute(a:items, [], result)
  return result
endfunction

let perms = Permutations([1, 2, 3])
echo len(perms)
for p in perms
  echo p
endfor
