DIGITS = [*'0'..'9', *'a'..'z'].freeze

def to_base(n, base)
  raise ArgumentError, 'base out of range' unless (2..36).cover?(base)
  return '0' if n.zero?

  sign = n.negative? ? '-' : ''
  sign + n.abs.digits(base).reverse.map { |d| DIGITS[d] }.join
end

[[255, 2], [255, 16], [-1295, 36], [0, 7], [2**100, 36]].each do |n, b|
  s = to_base(n, b)
  puts "#{n} base #{b} = #{s} (Integer#to_s agrees: #{s == n.to_s(b)}, roundtrip: #{s.to_i(b) == n})"
end
