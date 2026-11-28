def automorphic?(n)
  (n * n).to_s.end_with?(n.to_s)
end

p (0...1000).select { |n| automorphic?(n) } # [0, 1, 5, 6, 25, 76, 376, 625]
