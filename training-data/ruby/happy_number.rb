require 'set'

def happy?(n)
  seen = Set.new
  n = n.digits.sum { |d| d * d } while n != 1 && seen.add?(n)
  n == 1
end

p (1..50).select { |n| happy?(n) }
puts "count up to 10000: #{(1..10_000).count { |n| happy?(n) }}"
