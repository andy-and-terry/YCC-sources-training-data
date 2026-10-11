status = :active

case status
when :active   then puts "running"
when :inactive then puts "stopped"
end

puts status.to_s
puts "pending".to_sym.inspect
puts :abc.size
puts :b <=> :a
puts %i(red green blue).inspect

colors = {red: "#f00", green: "#0f0"}
puts colors[:red]
puts colors.keys.inspect
puts :"with space".inspect
puts status == :active ? "yes" : "no"
