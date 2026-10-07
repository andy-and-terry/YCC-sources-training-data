let x = 7

echo x > 5 ? 'big' : 'small'
echo x % 2 == 0 ? 'even' : 'odd'
echo x > 10 ? 'huge' : x > 5 ? 'medium' : 'tiny'

echo 1 && 0
echo 1 || 0
echo !1
echo !0
echo 0 || 'fallback'
echo 'first' ?? 'second'
echo v:null ?? 'default'
echo get({}, 'missing', 'dflt')

echo 5 > 3 && 2 > 1
echo (5 > 3) + (2 > 1) + (1 > 2)
echo 1 == 1.0
echo 'a' == 'a' && 'b' != 'c'

let name = ''
echo empty(name) ? 'anonymous' : name
let name = 'Ann'
echo empty(name) ? 'anonymous' : name

function! s:Max3(a, b, c) abort
  return a:a >= a:b ? (a:a >= a:c ? a:a : a:c) : (a:b >= a:c ? a:b : a:c)
endfunction
echo s:Max3(3, 9, 5) . ' ' . s:Max3(9, 3, 5) . ' ' . s:Max3(1, 2, 3)

function! s:Sign(n) abort
  return a:n > 0 ? 1 : a:n < 0 ? -1 : 0
endfunction
echo map([-5, 0, 8], {_, v -> s:Sign(v)})

echo has('vim9script') ? 'vim9 available' : 'legacy only'
echo (1 ? 'a' : 'b') . (0 ? 'c' : 'd')
echo 1 ? 2 : 3 + 10
