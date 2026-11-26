# Twin primes below 100; expect 8.
require 'prime'
puts (2...100).count { |p| p.prime? && (p + 2).prime? }
