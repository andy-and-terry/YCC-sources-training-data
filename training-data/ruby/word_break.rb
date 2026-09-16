def word_break?(s, word_dict)
  n = s.length
  dp = Array.new(n + 1, false)
  dp[0] = true

  (1..n).each do |i|
    (0...i).each do |j|
      if dp[j] && word_dict.include?(s[j...i])
        dp[i] = true
        break
      end
    end
  end

  dp[n]
end

dictionary = %w[leet code leetcode sand and sandbox]
puts word_break?('leetcode', dictionary)
puts word_break?('leetsandbox', dictionary)
puts word_break?('leetcat', dictionary)
