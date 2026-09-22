def build_lps(pattern : String) : Array(Int32)
  lps = Array(Int32).new(pattern.size, 0)
  length = 0
  i = 1
  while i < pattern.size
    if pattern[i] == pattern[length]
      length += 1
      lps[i] = length
      i += 1
    elsif length > 0
      length = lps[length - 1]
    else
      lps[i] = 0
      i += 1
    end
  end
  lps
end

def kmp_search(text : String, pattern : String) : Int32
  return -1 if pattern.empty?
  lps = build_lps(pattern)
  i = 0
  j = 0
  while i < text.size
    if text[i] == pattern[j]
      i += 1
      j += 1
      return i - j if j == pattern.size
    elsif j > 0
      j = lps[j - 1]
    else
      i += 1
    end
  end
  -1
end

puts kmp_search("abxabcabcaby", "abcaby")
puts kmp_search("hello world", "world")
puts kmp_search("hello world", "xyz")
