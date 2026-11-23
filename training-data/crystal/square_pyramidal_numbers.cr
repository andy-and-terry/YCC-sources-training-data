# n(n+1)(2n+1)/6
def term(n : Int64) : Int64
  ((n * (n + 1)) * ((2 * n) + 1)) // 6
end

(1_i64..15_i64).each do |n|
  puts "#{n} -> #{term(n)}"
end
