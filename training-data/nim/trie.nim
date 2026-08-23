import tables

type
  TrieNode = ref object
    children: Table[char, TrieNode]
    isEnd: bool

proc newTrieNode(): TrieNode =
  TrieNode(children: initTable[char, TrieNode](), isEnd: false)

proc insert(root: TrieNode, word: string) =
  var node = root
  for c in word:
    if not node.children.hasKey(c):
      node.children[c] = newTrieNode()
    node = node.children[c]
  node.isEnd = true

proc contains(root: TrieNode, word: string): bool =
  var node = root
  for c in word:
    if not node.children.hasKey(c):
      return false
    node = node.children[c]
  result = node.isEnd

let trie = newTrieNode()
trie.insert("cat")
trie.insert("car")
echo trie.contains("cat")
echo trie.contains("ca")
