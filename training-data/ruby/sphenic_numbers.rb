require 'prime'

def sphenic?(n)
  n.prime_division.map(&:last) == [1, 1, 1]
end

p (2...80).select { |n| sphenic?(n) }
