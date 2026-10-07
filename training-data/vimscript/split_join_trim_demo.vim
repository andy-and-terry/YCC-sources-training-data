let csv = 'alpha, beta ,gamma,  delta '

let parts = split(csv, ',')
echo parts
echo map(copy(parts), 'trim(v:val)')
echo join(map(copy(parts), 'trim(v:val)'), '|')

echo split('one two  three')
echo split('a1b22c333', '\d\+')
echo split('a,b;c', '[,;]')
echo split('abc', '\zs')
echo split(',a,,b,', ',', 1)
echo join(['x', 'y', 'z'])
echo join([1, 2, 3], '+')
echo join([[1, 2], [3]], ',')
echo join([], ',') . '|'

function! s:Words(text) abort
  return filter(split(a:text, '\W\+'), 'v:val !=# ""')
endfunction
echo s:Words('Hello, world! This is Vim.')

function! s:Capitalize(word) abort
  return toupper(a:word[0]) . tolower(a:word[1:])
endfunction
echo join(map(s:Words('tHE qUICK bROWN fox'), 's:Capitalize(v:val)'), ' ')

echo len(split('a b c'))
echo get(split('k=v', '='), 1, 'none')
echo get(split('novalue', '='), 1, 'none')
echo uniq(sort(split('b a c a b', ' ')))
echo reverse(split('1 2 3'))
echo trim("\t tabbed \n")
echo substitute('  lead', '^\s\+', '', '')
