local function new_trie_node()
  return { children = {}, is_end = false }
end

local function trie_insert(root, word)
  local node = root
  for i = 1, #word do
    local c = word:sub(i, i)
    if not node.children[c] then
      node.children[c] = new_trie_node()
    end
    node = node.children[c]
  end
  node.is_end = true
end

local function trie_contains(root, word)
  local node = root
  for i = 1, #word do
    local c = word:sub(i, i)
    if not node.children[c] then return false end
    node = node.children[c]
  end
  return node.is_end
end

local trie = new_trie_node()
trie_insert(trie, "cat")
trie_insert(trie, "car")
print(trie_contains(trie, "cat"))
print(trie_contains(trie, "ca"))
