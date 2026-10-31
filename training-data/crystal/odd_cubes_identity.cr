def cube_from_odds(n : Int64) : Int64
  start = n * n - n + 1
  (0_i64...n).sum { |i| start + 2 * i }
end

(1_i64..5_i64).each do |n|
  puts "#{n} #{cube_from_odds(n)} #{cube_from_odds(n) == n ** 3}"
end
