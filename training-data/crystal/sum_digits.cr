def sum_digits(n : Int32) : Int32
  m = n
  sum = 0
  while m > 0
    sum += m % 10
    m //= 10
  end
  sum
end

puts sum_digits(12345)
