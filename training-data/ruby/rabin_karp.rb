def rabin_karp(text, pattern)
  base = 256
  modulus = 101
  n = text.size
  m = pattern.size
  return [] if m > n

  high_order = base**(m - 1) % modulus
  pattern_hash = 0
  window_hash = 0
  matches = []

  m.times do |i|
    pattern_hash = (base * pattern_hash + pattern[i].ord) % modulus
    window_hash = (base * window_hash + text[i].ord) % modulus
  end

  (0..n - m).each do |i|
    if pattern_hash == window_hash && text[i, m] == pattern
      matches << i
    end

    next unless i < n - m

    window_hash = (base * (window_hash - text[i].ord * high_order) + text[i + m].ord) % modulus
    window_hash += modulus if window_hash.negative?
  end

  matches
end

puts rabin_karp('abracadabra', 'abra').inspect
puts rabin_karp('aaaaa', 'aa').inspect
