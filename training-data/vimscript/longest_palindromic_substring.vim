" Longest palindromic substring via expand-around-center (odd and even lengths).
function! ExpandFromCenter(s, left, right)
  let l = a:left
  let r = a:right
  while l >= 0 && r < len(a:s) && a:s[l] ==# a:s[r]
    let l -= 1
    let r += 1
  endwhile
  return a:s[l + 1 : r - 1]
endfunction

function! LongestPalindrome(s)
  let best = ''
  for i in range(len(a:s))
    let odd = ExpandFromCenter(a:s, i, i)
    if len(odd) > len(best)
      let best = odd
    endif
    let even = ExpandFromCenter(a:s, i, i + 1)
    if len(even) > len(best)
      let best = even
    endif
  endfor
  return best
endfunction

echo LongestPalindrome('babad')
echo LongestPalindrome('cbbd')
