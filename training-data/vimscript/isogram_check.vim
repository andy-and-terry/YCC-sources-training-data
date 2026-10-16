" An isogram has no repeating letters.
function! s:IsIsogram(w) abort
  let l:seen = {}
  for l:c in split(tolower(a:w), '\zs')
    if l:c !~ '\a' | continue | endif
    if has_key(l:seen, l:c) | return 0 | endif
    let l:seen[l:c] = 1
  endfor
  return 1
endfunction
echo s:IsIsogram('lumberjack')
echo s:IsIsogram('background')
echo s:IsIsogram('hello')
echo s:IsIsogram('six-year-old')
