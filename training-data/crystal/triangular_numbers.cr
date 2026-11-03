def triangular(count : Int32)
  sum = 0
  (1..count).map { |n| sum += n }
end

p triangular(10)
