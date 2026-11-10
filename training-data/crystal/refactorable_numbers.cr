def tau(n : Int32) : Int32
  (1..n).count { |d| n % d == 0 }
end

puts (1...60).select { |n| n % tau(n) == 0 }.join(" ") # 1 2 8 9 12 18 24 36 40 56
