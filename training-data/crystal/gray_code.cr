def to_gray(n : Int32) : Int32
  n ^ (n >> 1)
end

def from_gray(g : Int32) : Int32
  n = 0
  while g > 0
    n ^= g
    g >>= 1
  end
  n
end

8.times do |i|
  g = to_gray(i)
  puts "#{i} -> #{g.to_s(2).rjust(3, '0')} -> #{from_gray(g)}"
end
