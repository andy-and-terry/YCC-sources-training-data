def minimum_total(t : Array(Array(Int32))) : Int32
  dp = t.last.dup
  (t.size - 2).downto(0) do |r|
    t[r].each_index { |i| dp[i] = t[r][i] + {dp[i], dp[i + 1]}.min }
  end
  dp[0]
end

puts minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]]) # 11
