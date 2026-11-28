require "prime"

emirps = Prime.each(199).select do |p|
  r = p.to_s.reverse.to_i
  r != p && r.prime?
end

p emirps # [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
