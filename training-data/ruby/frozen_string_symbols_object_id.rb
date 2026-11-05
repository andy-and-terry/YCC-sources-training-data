a = "abc".freeze
puts a.frozen?
begin
  a << "d"
rescue FrozenError => e
  puts e.class
end
puts :sym.object_id == :sym.object_id
puts "s".object_id == "s".object_id
puts a.dup.frozen?
