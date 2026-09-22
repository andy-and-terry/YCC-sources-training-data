type SegmentTree = object
  tree: seq[int]
  n: int

proc build(st: var SegmentTree, arr: seq[int], node, start, stop: int) =
  if start == stop:
    st.tree[node] = arr[start]
  else:
    let mid = (start + stop) div 2
    build(st, arr, 2 * node, start, mid)
    build(st, arr, 2 * node + 1, mid + 1, stop)
    st.tree[node] = st.tree[2 * node] + st.tree[2 * node + 1]

proc newSegmentTree(arr: seq[int]): SegmentTree =
  result.n = arr.len
  result.tree = newSeq[int](4 * result.n)
  build(result, arr, 1, 0, result.n - 1)

proc query(st: SegmentTree, node, start, stop, l, r: int): int =
  if r < start or stop < l:
    return 0
  if l <= start and stop <= r:
    return st.tree[node]
  let mid = (start + stop) div 2
  query(st, 2 * node, start, mid, l, r) + query(st, 2 * node + 1, mid + 1, stop, l, r)

proc rangeSum(st: SegmentTree, l, r: int): int =
  query(st, 1, 0, st.n - 1, l, r)

proc update(st: var SegmentTree, node, start, stop, idx, value: int) =
  if start == stop:
    st.tree[node] = value
  else:
    let mid = (start + stop) div 2
    if idx <= mid:
      update(st, 2 * node, start, mid, idx, value)
    else:
      update(st, 2 * node + 1, mid + 1, stop, idx, value)
    st.tree[node] = st.tree[2 * node] + st.tree[2 * node + 1]

proc pointUpdate(st: var SegmentTree, idx, value: int) =
  update(st, 1, 0, st.n - 1, idx, value)

let arr = @[1, 3, 5, 7, 9, 11]
var st = newSegmentTree(arr)
echo st.rangeSum(1, 3)
st.pointUpdate(1, 10)
echo st.rangeSum(1, 3)
