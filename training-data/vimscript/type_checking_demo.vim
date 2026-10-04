function! s:TypeName(value) abort
  let l:names = {
        \ v:t_number: 'number',
        \ v:t_string: 'string',
        \ v:t_func: 'funcref',
        \ v:t_list: 'list',
        \ v:t_dict: 'dict',
        \ v:t_float: 'float',
        \ v:t_bool: 'bool',
        \ v:t_none: 'none',
        \ }
  return get(l:names, type(a:value), 'unknown')
endfunction

for s:v in [42, 'text', function('len'), [1], {'a': 1}, 3.5, v:true, v:null]
  echo s:TypeName(s:v)
endfor

echo type(0) == v:t_number
echo type('') == v:t_string
echo type([]) == type([1, 2])
echo empty([]) . ' ' . empty('') . ' ' . empty(0) . ' ' . empty({}) . ' ' . empty('x')
echo exists('g:no_such_variable')
let g:defined_var = 1
echo exists('g:defined_var')
echo exists('*len')
echo exists(':echo')
echo '10' + 5
echo '10' . 5
echo '3abc' + 1
echo 'abc' + 1
echo 5 == '5'
echo 'a' ==# 'A'
echo 'a' ==? 'A'
echo string(1.0) . ' ' . string(1) . ' ' . string('1') . ' ' . string([1, 'a'])
echo str2nr('0x1F', 16) . ' ' . str2nr('12abc') . ' ' . str2float('2.5e2')
echo float2nr(3.9) . ' ' . float2nr(-3.9) . ' ' . string(round(2.5))
