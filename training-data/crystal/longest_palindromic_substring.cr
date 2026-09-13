def longest_palindromic_substring(s : String) : String
  return "" if s.empty?
  chars = s.chars
  start = 0
  max_len = 1

  expand = ->(left : Int32, right : Int32) {
    l = left
    r = right
    while l >= 0 && r < chars.size && chars[l] == chars[r]
      l -= 1
      r += 1
    end
    r - l - 1
  }

  (0...chars.size).each do |i|
    len1 = expand.call(i, i)
    len2 = expand.call(i, i + 1)
    len = Math.max(len1, len2)
    if len > max_len
      max_len = len
      start = i - (len - 1) // 2
    end
  end

  s[start, max_len]
end

puts longest_palindromic_substring("babad")
puts longest_palindromic_substring("cbbd")
puts longest_palindromic_substring("racecar")
