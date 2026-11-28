require 'prime'

ps = Prime.each(50).to_a
p ps.each_cons(2).select { |a, b| b - a == 2 }
