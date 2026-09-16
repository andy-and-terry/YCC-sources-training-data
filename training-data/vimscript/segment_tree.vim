function! SegTreeBuild(arr)
  let n = len(a:arr)
  let tree = repeat([0], 2 * n)
  let i = n
  while i < 2 * n
    let tree[i] = a:arr[i - n]
    let i += 1
  endwhile
  let i = n - 1
  while i > 0
    let tree[i] = tree[2 * i] + tree[2 * i + 1]
    let i -= 1
  endwhile
  return tree
endfunction

function! SegTreeUpdate(tree, n, pos, value)
  let i = a:pos + a:n
  let a:tree[i] = a:value
  while i > 1
    let i = i / 2
    let a:tree[i] = a:tree[2 * i] + a:tree[2 * i + 1]
  endwhile
endfunction

" Sum over the half-open range [left, right).
function! SegTreeQuery(tree, n, left, right)
  let l = a:left + a:n
  let r = a:right + a:n
  let total = 0
  while l < r
    if l % 2 == 1
      let total += a:tree[l]
      let l += 1
    endif
    if r % 2 == 1
      let r -= 1
      let total += a:tree[r]
    endif
    let l = l / 2
    let r = r / 2
  endwhile
  return total
endfunction

let arr = [1, 3, 5, 7, 9, 11]
let n = len(arr)
let tree = SegTreeBuild(arr)
echo SegTreeQuery(tree, n, 1, 4)
call SegTreeUpdate(tree, n, 1, 10)
echo SegTreeQuery(tree, n, 1, 4)
