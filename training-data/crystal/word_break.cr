def word_break(s : String, word_dict : Array(String)) : Bool
  words = word_dict.to_set
  n = s.size
  dp = Array(Bool).new(n + 1, false)
  dp[0] = true

  (1..n).each do |i|
    (0...i).each do |j|
      if dp[j] && words.includes?(s[j...i])
        dp[i] = true
        break
      end
    end
  end

  dp[n]
end

puts word_break("leetcode", ["leet", "code"])
puts word_break("applepenapple", ["apple", "pen"])
puts word_break("catsandog", ["cats", "dog", "sand", "and", "cat"])
