def rabin_karp(text : String, pattern : String) : Array(Int32)
  n = text.size
  m = pattern.size
  matches = [] of Int32
  return matches if m == 0 || m > n

  base = 256_u64
  modulus = 1_000_000_007_u64
  high_order = 1_u64
  (m - 1).times { high_order = (high_order * base) % modulus }

  pattern_hash = 0_u64
  text_hash = 0_u64
  (0...m).each do |i|
    pattern_hash = (pattern_hash * base + pattern.byte_at(i).to_u64) % modulus
    text_hash = (text_hash * base + text.byte_at(i).to_u64) % modulus
  end

  (0..(n - m)).each do |i|
    if pattern_hash == text_hash && text[i, m] == pattern
      matches << i
    end
    if i < n - m
      leading = text.byte_at(i).to_u64
      text_hash = (text_hash + modulus - (leading * high_order) % modulus) % modulus
      text_hash = (text_hash * base + text.byte_at(i + m).to_u64) % modulus
    end
  end

  matches
end

p rabin_karp("abracadabra", "abra")
p rabin_karp("aaaaaa", "aa")
