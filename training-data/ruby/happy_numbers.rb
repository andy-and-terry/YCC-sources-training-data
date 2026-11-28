def happy?(n)
  seen = {}
  until n == 1 || seen[n]
    seen[n] = true
    n = n.digits.sum { |d| d * d }
  end
  n == 1
end

puts (1..).lazy.select { |n| happy?(n) }.first(8).inspect # [1, 7, 10, 13, 19, 23, 28, 31]
