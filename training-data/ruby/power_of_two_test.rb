def power_of_two?(n)
  n > 0 && (n & (n - 1)).zero?
end

p (1...40).select { |n| power_of_two?(n) }
