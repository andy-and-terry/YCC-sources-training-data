def automorphic?(n)
  (n * n).to_s.end_with?(n.to_s)
end

puts (1...1000).select { |n| automorphic?(n) }.join(" ")
