def coin_change(coins, amount)
  dp = Array.new(amount + 1, Float::INFINITY)
  dp[0] = 0
  (1..amount).each do |a|
    coins.each { |coin| dp[a] = [dp[a], dp[a - coin] + 1].min if coin <= a }
  end
  dp[amount] == Float::INFINITY ? -1 : dp[amount]
end

puts coin_change([1, 2, 5], 11)
