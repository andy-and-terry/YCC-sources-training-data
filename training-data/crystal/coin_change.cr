def coin_change(coins : Array(Int32), amount : Int32) : Int32
  dp = Array.new(amount + 1, amount + 1)
  dp[0] = 0
  (1..amount).each do |a|
    coins.each do |c|
      dp[a] = Math.min(dp[a], dp[a - c] + 1) if c <= a
    end
  end
  dp[amount] > amount ? -1 : dp[amount]
end

puts coin_change([1, 2, 5], 11)
