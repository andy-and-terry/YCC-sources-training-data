def rod_cutting(prices : Array(Int32), length : Int32) : Int32
  best = Array.new(length + 1, 0)

  (1..length).each do |n|
    (1..n).each do |cut|
      revenue = prices[cut - 1] + best[n - cut]
      best[n] = revenue if revenue > best[n]
    end
  end

  best[length]
end

prices = [1, 5, 8, 9, 10, 17, 17, 20]
puts rod_cutting(prices, 4)
puts rod_cutting(prices, 8)
