# Collapse consecutive duplicates with chunk_while.
def dedupe(s) = s.chars.chunk_while { |a, b| a == b }.map(&:first).join
puts dedupe("aabbbcdd")
