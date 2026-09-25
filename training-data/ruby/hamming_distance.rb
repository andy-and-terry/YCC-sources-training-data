def hamming(a, b)
  raise ArgumentError, 'strings must have equal length' unless a.size == b.size

  a.chars.zip(b.chars).count { |x, y| x != y }
end

def hamming_bits(x, y) = (x ^ y).to_s(2).count('1')

puts hamming('karolin', 'kathrin'), hamming_bits(1, 4), hamming_bits(2**64 - 1, 0)
begin
  hamming('abc', 'ab')
rescue ArgumentError => e
  puts "error: #{e.message}"
end
