def longest_common_subsequence(a : String, b : String) : String
  m, n = a.size, b.size
  dp = Array.new(m + 1) { Array.new(n + 1, 0) }

  (1..m).each do |i|
    (1..n).each do |j|
      if a[i - 1] == b[j - 1]
        dp[i][j] = dp[i - 1][j - 1] + 1
      else
        dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1])
      end
    end
  end

  result = [] of Char
  i, j = m, n
  while i > 0 && j > 0
    if a[i - 1] == b[j - 1]
      result << a[i - 1]
      i -= 1
      j -= 1
    elsif dp[i - 1][j] > dp[i][j - 1]
      i -= 1
    else
      j -= 1
    end
  end

  result.reverse.join
end

puts longest_common_subsequence("ABCBDAB", "BDCABA")
