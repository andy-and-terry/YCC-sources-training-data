" Binary Indexed Tree (Fenwick tree): 1-indexed point update, prefix sum query.
function! FenwickUpdate(tree, n, pos, delta)
  let i = a:pos
  while i <= a:n
    let a:tree[i] += a:delta
    let i += and(i, -i)
  endwhile
endfunction

function! FenwickQuery(tree, pos)
  let i = a:pos
  let total = 0
  while i > 0
    let total += a:tree[i]
    let i -= and(i, -i)
  endwhile
  return total
endfunction

function! FenwickRangeSum(tree, left, right)
  return FenwickQuery(a:tree, a:right) - FenwickQuery(a:tree, a:left - 1)
endfunction

let n = 6
let tree = repeat([0], n + 1)
let values = [1, 3, 5, 7, 9, 11]
let idx = 1
for v in values
  call FenwickUpdate(tree, n, idx, v)
  let idx += 1
endfor
echo FenwickQuery(tree, 4)
echo FenwickRangeSum(tree, 2, 4)
call FenwickUpdate(tree, n, 2, 10)
echo FenwickRangeSum(tree, 2, 4)
