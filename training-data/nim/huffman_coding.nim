import tables, heapqueue

type
  HuffNode = ref object
    freq: int
    ch: char
    left, right: HuffNode

proc `<`(a, b: HuffNode): bool = a.freq < b.freq
proc `<=`(a, b: HuffNode): bool = a.freq <= b.freq

proc buildCodes(node: HuffNode, prefix: string, codes: var Table[char, string]) =
  if node.left == nil and node.right == nil:
    codes[node.ch] = if prefix.len > 0: prefix else: "0"
    return
  if node.left != nil:
    buildCodes(node.left, prefix & "0", codes)
  if node.right != nil:
    buildCodes(node.right, prefix & "1", codes)

proc huffmanCodes(text: string): Table[char, string] =
  var freq = initTable[char, int]()
  for c in text:
    freq[c] = freq.getOrDefault(c, 0) + 1

  var pq = initHeapQueue[HuffNode]()
  for c, f in freq:
    pq.push(HuffNode(freq: f, ch: c))

  while pq.len > 1:
    let a = pq.pop()
    let b = pq.pop()
    pq.push(HuffNode(freq: a.freq + b.freq, left: a, right: b, ch: '\0'))

  result = initTable[char, string]()
  if pq.len > 0:
    buildCodes(pq.pop(), "", result)

let codes = huffmanCodes("abracadabra")
for c, code in codes:
  echo c, ": ", code
