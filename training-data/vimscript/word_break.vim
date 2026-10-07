" Word Break: can string s be segmented into space-separated dictionary words?
function! WordBreak(s, wordDict)
  let n = len(a:s)
  let dp = repeat([0], n + 1)
  let dp[0] = 1
  for i in range(1, n)
    for word in a:wordDict
      let wlen = len(word)
      if wlen <= i && dp[i - wlen] && a:s[i - wlen : i - 1] ==# word
        let dp[i] = 1
        break
      endif
    endfor
  endfor
  return dp[n]
endfunction

echo WordBreak('leetcode', ['leet', 'code'])
echo WordBreak('catsandog', ['cats', 'dog', 'sand', 'and', 'cat'])
