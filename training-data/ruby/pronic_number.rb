def pronic?(n)
  k = Integer.sqrt(n)
  k * (k + 1) == n
end

puts (0...100).select { |n| pronic?(n) }.join(" ")
