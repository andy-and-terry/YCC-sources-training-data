def automorphic?(n : Int64) : Bool
  (n * n).to_s.ends_with?(n.to_s)
end

puts (0_i64...1000_i64).select { |n| automorphic?(n) }.join(" ") # 0 1 5 6 25 76 376 625
