# 2n(n-1)+1
def term(n : Int64) : Int64
  ((2 * n) * (n - 1)) + 1
end

(1_i64..15_i64).each do |n|
  puts "#{n} -> #{term(n)}"
end
