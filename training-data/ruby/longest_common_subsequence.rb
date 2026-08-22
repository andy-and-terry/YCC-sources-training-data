def lcs(a, b)
  m, n = a.length, b.length
  dp = Array.new(m + 1) { Array.new(n + 1, '') }
  (1..m).each do |i|
    (1..n).each do |j|
      dp[i][j] = if a[i - 1] == b[j - 1]
                   dp[i - 1][j - 1] + a[i - 1]
                 else
                   dp[i - 1][j].length >= dp[i][j - 1].length ? dp[i - 1][j] : dp[i][j - 1]
                 end
    end
  end
  dp[m][n]
end

puts lcs('ABCBDAB', 'BDCABA')
