def persistence(n : Int64) : Int32
  steps = 0
  while n >= 10
    n = n.digits.reduce(1_i64) { |acc, d| acc * d }
    steps += 1
  end
  steps
end

[39_i64, 77_i64, 999_i64, 10_i64].each { |n| puts "#{n} #{persistence(n)}" }
