def rod_cutting(prices : Array(Int32), length : Int32) : Int32
  dp = Array.new(length + 1, 0)

  (1..length).each do |i|
    best = 0
    (1..i).each do |cut|
      best = Math.max(best, prices[cut - 1] + dp[i - cut])
    end
    dp[i] = best
  end

  dp[length]
end

prices = [1, 5, 8, 9, 10, 17, 17, 20]
puts rod_cutting(prices, 8)
puts rod_cutting(prices, 4)
