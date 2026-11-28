let s = 'banana'
let n = len(s)
let i = 0
while i < n
  let j = i + 1
  let k = i
  while j < n && s[k] <=# s[j]
    let k = s[k] <# s[j] ? i : k + 1
    let j += 1
  endwhile
  while i <= k
    echo s[i : i + j - k - 1]
    let i += j - k
  endwhile
endwhile
