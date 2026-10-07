# Common bit tricks.
def popcount(n : Int32) : Int32
  count = 0
  while n != 0
    n &= n - 1
    count += 1
  end
  count
end

n = 0b1011_0100
puts popcount(n)
puts n.popcount
puts n & 1
puts (n >> 2).to_s(2)
puts (1 << 5)
puts n ^ 0xFF
puts n.bit(2)
puts (n & -n).to_s(2) # lowest set bit
puts n.trailing_zeros_count
puts n.leading_zeros_count
