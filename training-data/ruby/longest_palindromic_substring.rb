def expand(s, left, right)
  while left >= 0 && right < s.length && s[left] == s[right]
    left -= 1
    right += 1
  end
  s[(left + 1)...right]
end

def longest_palindromic_substring(s)
  return "" if s.empty?

  best = s[0]
  (0...s.length).each do |i|
    [expand(s, i, i), expand(s, i, i + 1)].each do |candidate|
      best = candidate if candidate.length > best.length
    end
  end
  best
end

puts longest_palindromic_substring("babad")
puts longest_palindromic_substring("cbbd")
