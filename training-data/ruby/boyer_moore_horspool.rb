def horspool(text, pattern)
  m = pattern.size
  n = text.size
  return [] if m.zero? || m > n

  shift = Hash.new(m)
  pattern[0...-1].each_char.with_index { |c, i| shift[c] = m - 1 - i }
  matches = []
  i = 0
  while i <= n - m
    matches << i if text[i, m] == pattern
    i += shift[text[i + m - 1]]
  end
  matches
end

text = 'here is a simple example, an example indeed'
p horspool(text, 'example')
p text.enum_for(:scan, /example/).map { Regexp.last_match.begin(0) }
