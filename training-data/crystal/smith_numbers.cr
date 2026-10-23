def digit_sum(n : Int32) : Int32
  total = 0
  while n > 0
    total += n % 10
    n //= 10
  end
  total
end

def smith?(n : Int32) : Bool
  m = n
  factor_sum = 0
  factor_count = 0
  p = 2
  while p * p <= m
    while m % p == 0
      factor_sum += digit_sum(p)
      factor_count += 1
      m //= p
    end
    p += 1
  end
  if m > 1
    factor_sum += digit_sum(m)
    factor_count += 1
  end
  factor_count > 1 && factor_sum == digit_sum(n)
end

puts((4...100).select { |n| smith?(n) }.join(" "))
