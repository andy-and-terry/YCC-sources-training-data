# Primorials up to 1e6, including 1; expect 8.
require 'prime'
values = [1]
acc = 1
Prime.each do |q|
  acc *= q
  break if acc > 1_000_000
  values << acc
end
puts values.length
puts values.join(' ')
