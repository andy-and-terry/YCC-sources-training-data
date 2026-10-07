function! Flatten(list)
  let result = []
  for item in a:list
    if type(item) == type([])
      call extend(result, Flatten(item))
    else
      call add(result, item)
    endif
  endfor
  return result
endfunction

echo Flatten([1, [2, [3, [4, 5]], 6], [[7]]])
