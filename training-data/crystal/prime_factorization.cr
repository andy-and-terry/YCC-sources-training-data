def prime_factors(n : Int32) : Array(Int32)
  factors = [] of Int32
  num = n
  divisor = 2
  while divisor * divisor <= num
    while num % divisor == 0
      factors << divisor
      num //= divisor
    end
    divisor += 1
  end
  factors << num if num > 1
  factors
end

[60, 97, 1, 360, 17].each do |n|
  puts "#{n}: #{prime_factors(n).inspect}"
end
