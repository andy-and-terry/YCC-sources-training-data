def next_term(s)
  s.chars.chunk_while { |a, b| a == b }.map { |run| "#{run.size}#{run.first}" }.join
end

terms = Enumerator.produce("1") { |s| next_term(s) }.take(8)
puts terms
