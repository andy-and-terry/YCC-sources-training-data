def digit_sum(n)
  n.to_s.chars.sum(&:to_i)
end

def factor_digit_sum(n)
  total = 0
  d = 2
  while n > 1
    while (n % d).zero?
      total += digit_sum(d)
      n /= d
    end
    d += 1
  end
  total
end

def prime?(n)
  n > 1 && (2..Math.sqrt(n)).none? { |d| (n % d).zero? }
end

puts (2...100).select { |n| !prime?(n) && digit_sum(n) == factor_digit_sum(n) }.join(" ")
