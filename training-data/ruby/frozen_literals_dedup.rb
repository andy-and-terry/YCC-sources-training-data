# frozen_string_literal: true

s = "literal"
puts s.frozen?
begin
  s << "x"
rescue FrozenError => e
  puts e.message
end

t = +"mutable"
t << "!"
puts t, t.frozen?
u = s.dup
u << "!"
puts u
puts (-"abc").equal?(-"abc")
puts "abc".equal?("abc")
puts "a#{1}b".frozen?
puts String.new("x").frozen?, :sym.to_s.frozen?
CONFIG = { name: "x", list: [1, 2] }.freeze
CONFIG[:list] << 3
puts CONFIG.inspect, CONFIG.frozen?, CONFIG[:list].frozen?
puts Ractor.make_shareable([+"a"]).first.frozen?
