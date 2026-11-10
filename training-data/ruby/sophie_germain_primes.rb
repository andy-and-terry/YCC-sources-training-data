def prime?(n)
  n >= 2 && (2..Integer.sqrt(n)).none? { |d| (n % d).zero? }
end

found = (2..).lazy.select { |p| prime?(p) && prime?(2 * p + 1) }.first(10)
puts found.join(" ") # 2 3 5 11 23 29 41 53 83 89
