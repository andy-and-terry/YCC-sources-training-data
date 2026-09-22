def rod_cutting(prices, length)
  best = Array.new(length + 1, 0)
  (1..length).each do |n|
    best[n] = (1..n).map { |i| prices[i - 1] + best[n - i] }.max
  end
  best[length]
end

prices = [1, 5, 8, 9, 10, 17, 17, 20]
puts rod_cutting(prices, 8)
puts rod_cutting(prices, 4)
