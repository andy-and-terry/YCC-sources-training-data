def rabin_karp(text, pattern)
  return [] if pattern.empty? || pattern.length > text.length

  base = 256
  modulus = 1_000_000_007
  m = pattern.length
  n = text.length

  high_order = 1
  (m - 1).times { high_order = (high_order * base) % modulus }

  pattern_hash = 0
  window_hash = 0
  pattern.each_byte { |b| pattern_hash = (pattern_hash * base + b) % modulus }
  text[0, m].each_byte { |b| window_hash = (window_hash * base + b) % modulus }

  matches = []
  (0..n - m).each do |i|
    if window_hash == pattern_hash && text[i, m] == pattern
      matches << i
    end
    next_index = i + m
    if next_index < n
      window_hash = (window_hash - text.getbyte(i) * high_order) % modulus
      window_hash = (window_hash * base + text.getbyte(next_index)) % modulus
      window_hash += modulus if window_hash.negative?
    end
  end
  matches
end

puts rabin_karp("abxabcabcabyabc", "abc").inspect
puts rabin_karp("aaaa", "aa").inspect
puts rabin_karp("hello", "world").inspect
