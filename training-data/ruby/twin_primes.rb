require "prime"

pairs = Prime.each(80).each_cons(2).select { |a, b| b - a == 2 }
puts pairs.map { |a, b| "(#{a},#{b})" }.join(" ") # (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
