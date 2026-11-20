# Twin primes below a limit.
require 'prime'
p Prime.each(50).each_cons(2).select { |a, b| b - a == 2 }
