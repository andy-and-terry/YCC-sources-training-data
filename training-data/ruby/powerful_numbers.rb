require 'prime'

def powerful?(n)
  n.prime_division.all? { |_, e| e >= 2 }
end

puts (1..100).select { |n| powerful?(n) }.join(' ')
