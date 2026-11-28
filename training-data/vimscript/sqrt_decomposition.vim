let a = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5]
let bs = 4
let blk = [0, 0, 0]
for i in range(len(a))
  let blk[i / bs] += a[i]
endfor
let [i, r, s] = [2, 9, 0]
while i <= r
  if i % bs == 0 && i + bs - 1 <= r
    let s += blk[i / bs]
    let i += bs
  else
    let s += a[i]
    let i += 1
  endif
endwhile
echo s
