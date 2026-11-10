def tau(n)
  (1..n).count { |d| (n % d).zero? }
end

puts (1...60).select { |n| (n % tau(n)).zero? }.join(" ") # 1 2 8 9 12 18 24 36 40 56
