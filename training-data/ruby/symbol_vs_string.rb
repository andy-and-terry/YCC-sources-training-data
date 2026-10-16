s1 = "ruby"
s2 = "ruby"
puts s1.equal?(s2), s1 == s2
puts :ruby.equal?(:ruby), :ruby.object_id == :ruby.object_id

puts :abc.to_proc.call("x") rescue puts "no method abc"
puts :upcase.to_proc.call("x")
puts %i[a b c].inspect, %w[a b c].inspect
puts "hello world".to_sym.inspect
puts :"with space".inspect, :a <=> :b
puts :abc.length, :abc.to_s.frozen?, :abc.frozen?
puts Symbol.all_symbols.size > 100
puts({ "a" => 1, a: 2 }.inspect)
puts "sym".to_sym == :sym
