function! TypeName(value)
  let t = type(a:value)
  if t == v:t_number
    return 'number'
  elseif t == v:t_string
    return 'string'
  elseif t == v:t_list
    return 'list'
  elseif t == v:t_dict
    return 'dict'
  elseif t == v:t_float
    return 'float'
  elseif t == v:t_func
    return 'funcref'
  elseif t == v:t_bool
    return 'bool'
  endif
  return 'other'
endfunction

for Item in [1, 'a', [1], {'k': 1}, 1.5, function('strlen'), v:true]
  echo TypeName(Item)
endfor

echo exists('g:not_defined')
let g:defined = 1
echo exists('g:defined')
echo exists('*strlen')
echo has('patch-8.0.0')
echo empty([]) . empty('') . empty({}) . empty(0)
