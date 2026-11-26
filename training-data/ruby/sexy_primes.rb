# Sexy primes below 100; expect 16 pairs.
require 'prime'
puts (2...100).count { |q| q.prime? && (q + 6).prime? }
