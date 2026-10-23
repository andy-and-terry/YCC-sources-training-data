let g:flag = 1

echo exists('g:flag')
echo exists('g:missing')
echo exists('*strlen')
echo exists(':echo')
echo exists('&tabstop')
echo has('eval')
echo has('nonexistent_feature_xyz')

function! Safe(name) abort
  if exists('g:' . a:name)
    return get(g:, a:name)
  endif
  return 'unset'
endfunction

echo Safe('flag')
echo Safe('other')
