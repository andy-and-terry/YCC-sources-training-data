def cube_from_odds(n)
  start = n * n - n + 1
  (0...n).sum { |i| start + 2 * i }
end

(1..5).each { |n| puts "#{n} #{cube_from_odds(n)} #{cube_from_odds(n) == n**3}" }
