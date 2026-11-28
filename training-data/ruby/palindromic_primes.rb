require "prime"

result = Prime.each(199).select { |p| p.to_s == p.to_s.reverse }
p result # [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
