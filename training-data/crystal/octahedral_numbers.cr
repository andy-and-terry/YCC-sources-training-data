# n(2n^2+1)/3
def term(n : Int64) : Int64
  (n * (((2 * n) * n) + 1)) // 3
end

(1_i64..15_i64).each do |n|
  puts "#{n} -> #{term(n)}"
end
