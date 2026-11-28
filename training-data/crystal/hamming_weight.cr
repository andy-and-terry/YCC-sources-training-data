def popcount(n : Int) : Int32
  c = 0
  while n > 0
    n &= n - 1
    c += 1
  end
  c
end

puts popcount(0b10110111), 0b10110111.popcount
