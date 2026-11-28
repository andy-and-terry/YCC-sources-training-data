def popcount(n)
  c = 0
  while n > 0
    n &= n - 1
    c += 1
  end
  c
end

puts popcount(0b10110111)
puts 0b10110111.to_s(2).count('1')
