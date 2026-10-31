require 'prime'

def semiprime?(n)
  n.prime_division.sum { |_, e| e } == 2
end

p (2...30).select { |n| semiprime?(n) }
