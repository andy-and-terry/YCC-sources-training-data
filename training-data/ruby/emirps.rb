# Emirps below 200; expect 15.
require 'prime'
emirps = (2...200).select { |n| n.prime? && n.to_s.reverse.to_i != n && n.to_s.reverse.to_i.prime? }
puts emirps.length
puts emirps.join(' ')
