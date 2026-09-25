function! SortedKey(word)
  return join(sort(split(a:word, '\zs')), '')
endfunction

function! GroupAnagrams(words)
  let groups = {}
  for word in a:words
    let key = SortedKey(word)
    if !has_key(groups, key)
      let groups[key] = []
    endif
    call add(groups[key], word)
  endfor
  return values(groups)
endfunction

echo GroupAnagrams(['eat', 'tea', 'tan', 'ate', 'nat', 'bat'])
