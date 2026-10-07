def to_gray(n) = n ^ (n >> 1)

def from_gray(g)
  b = 0
  while g.positive?
    b ^= g
    g >>= 1
  end
  b
end

# Reflect-and-prefix construction
def gray_strings(bits) = bits.times.reduce(['']) { |codes, _| codes.map { |c| "0#{c}" } + codes.reverse.map { |c| "1#{c}" } }

codes = gray_strings(4)
codes.each_with_index do |s, i|
  raise "mismatch at #{i}" unless s.to_i(2) == to_gray(i) && from_gray(to_gray(i)) == i
end
puts codes.join(' ')
puts codes.each_cons(2).all? { |a, b| (a.to_i(2) ^ b.to_i(2)).to_s(2).count('1') == 1 }
