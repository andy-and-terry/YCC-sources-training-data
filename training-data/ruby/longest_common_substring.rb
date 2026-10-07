def longest_common_substring(a, b)
  dp = Array.new(a.length + 1) { Array.new(b.length + 1, 0) }
  best_len = 0
  best_end = 0

  (1..a.length).each do |i|
    (1..b.length).each do |j|
      if a[i - 1] == b[j - 1]
        dp[i][j] = dp[i - 1][j - 1] + 1
        if dp[i][j] > best_len
          best_len = dp[i][j]
          best_end = i
        end
      end
    end
  end
  a[(best_end - best_len)...best_end]
end

puts longest_common_substring("abcdxyz", "xyzabcd")
puts longest_common_substring("zxabcdezy", "yzabcdezx")
