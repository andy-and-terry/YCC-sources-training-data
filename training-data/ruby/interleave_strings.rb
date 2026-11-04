def interleave(*parts)
  first, *rest = parts.map(&:chars)
  first.zip(*rest).flatten.compact.join + parts.map { |s| s[first.size..] }.compact.join
end

puts interleave("abc", "12345")
puts interleave("ab", "cd", "efg")
