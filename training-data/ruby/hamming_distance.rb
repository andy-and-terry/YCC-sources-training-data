def hamming(a, b)
  raise ArgumentError, "strands must be of equal length" unless a.length == b.length

  a.chars.zip(b.chars).count { |x, y| x != y }
end

puts hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT")
begin
  hamming("AB", "A")
rescue ArgumentError => e
  puts "error: #{e.message}"
end
