function! TrieInsert(node, word)
  let node = a:node
  for c in split(a:word, '\zs')
    if !has_key(node, c)
      let node[c] = {}
    endif
    let node = node[c]
  endfor
  let node['__end__'] = 1
endfunction

function! TrieContains(node, word)
  let node = a:node
  for c in split(a:word, '\zs')
    if !has_key(node, c)
      return 0
    endif
    let node = node[c]
  endfor
  return has_key(node, '__end__')
endfunction

let trie = {}
call TrieInsert(trie, 'cat')
call TrieInsert(trie, 'car')
echo TrieContains(trie, 'cat')
echo TrieContains(trie, 'ca')
