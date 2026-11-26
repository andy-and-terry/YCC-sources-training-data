# Palindromic primes below 200; expect 10.
require 'prime'
found = (2...200).select { |n| n.to_s == n.to_s.reverse && n.prime? }
puts found.join(' ')
puts found.length
