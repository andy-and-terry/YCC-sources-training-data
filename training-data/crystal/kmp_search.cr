def build_lps(pattern : String) : Array(Int32)
  lps = Array.new(pattern.size, 0)
  length = 0
  i = 1

  while i < pattern.size
    if pattern[i] == pattern[length]
      length += 1
      lps[i] = length
      i += 1
    elsif length != 0
      length = lps[length - 1]
    else
      lps[i] = 0
      i += 1
    end
  end

  lps
end

def kmp_search(text : String, pattern : String) : Array(Int32)
  return [] of Int32 if pattern.empty?

  lps = build_lps(pattern)
  matches = [] of Int32
  i = 0
  j = 0

  while i < text.size
    if text[i] == pattern[j]
      i += 1
      j += 1
      if j == pattern.size
        matches << i - j
        j = lps[j - 1]
      end
    elsif j != 0
      j = lps[j - 1]
    else
      i += 1
    end
  end

  matches
end

puts kmp_search("ababcababcabc", "abcab").inspect
puts kmp_search("aaaaa", "aa").inspect
