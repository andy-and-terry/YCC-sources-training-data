function! TypeName(val)
  let t = type(a:val)
  if t == type(0)
    return 'number'
  elseif t == type('')
    return 'string'
  elseif t == type([])
    return 'list'
  elseif t == type({})
    return 'dict'
  elseif t == type(1.0)
    return 'float'
  elseif t == type(function('type'))
    return 'funcref'
  endif
  return 'other'
endfunction

for V in [1, 'a', [1], {'k': 1}, 2.5, function('len')]
  echo TypeName(V)
endfor
