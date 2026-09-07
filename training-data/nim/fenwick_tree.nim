type FenwickTree = object
  tree: seq[int]
  n: int

proc newFenwickTree(n: int): FenwickTree =
  result.n = n
  result.tree = newSeq[int](n + 1)

proc update(ft: var FenwickTree, i, delta: int) =
  var idx = i + 1
  while idx <= ft.n:
    ft.tree[idx] += delta
    idx += idx and (-idx)

proc prefixSum(ft: FenwickTree, i: int): int =
  var idx = i + 1
  while idx > 0:
    result += ft.tree[idx]
    idx -= idx and (-idx)

proc rangeSum(ft: FenwickTree, l, r: int): int =
  result = ft.prefixSum(r) - (if l == 0: 0 else: ft.prefixSum(l - 1))

var ft = newFenwickTree(8)
let values = @[3, 2, -1, 6, 5, 4, -3, 3]
for i, v in values:
  ft.update(i, v)
echo ft.prefixSum(5)
echo ft.rangeSum(2, 6)
ft.update(0, 4)
echo ft.prefixSum(5)
