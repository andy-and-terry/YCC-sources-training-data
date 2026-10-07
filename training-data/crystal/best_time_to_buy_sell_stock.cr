def max_profit(prices : Array(Int32)) : Int32
  return 0 if prices.empty?

  min_price = prices[0]
  best_profit = 0

  prices.each do |price|
    min_price = Math.min(min_price, price)
    best_profit = Math.max(best_profit, price - min_price)
  end

  best_profit
end

puts max_profit([7, 1, 5, 3, 6, 4])
