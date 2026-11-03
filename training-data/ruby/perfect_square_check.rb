def perfect_square?(n)
  n >= 0 && Integer.sqrt(n)**2 == n
end

p (0...30).select { |n| perfect_square?(n) }
