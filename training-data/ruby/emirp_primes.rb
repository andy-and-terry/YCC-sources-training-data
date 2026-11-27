require "prime"

emirps = Prime.each(99).select do |p|
  r = p.to_s.reverse.to_i
  r != p && r.prime?
end
puts emirps.inspect
