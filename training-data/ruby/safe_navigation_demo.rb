User = Struct.new(:name, :profile)
Profile = Struct.new(:address)
Address = Struct.new(:city)

full = User.new("Ann", Profile.new(Address.new("Paris")))
partial = User.new("Bob", Profile.new(nil))
none = User.new("Cy", nil)

[full, partial, none].each do |u|
  city = u.profile&.address&.city
  puts "#{u.name}: #{city.inspect}"
end

puts nil&.length.inspect
puts "abc"&.length

name = nil
puts (name&.upcase || "anonymous")

value = nil
puts value.to_s.empty?
puts [nil, "x"].map { |s| s&.upcase }.inspect

counts = { a: nil, b: 2 }
counts[:a] ||= 0
counts[:b] &&= counts[:b] * 10
puts counts.inspect
