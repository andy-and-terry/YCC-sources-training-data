User = Struct.new(:name, :address)
Address = Struct.new(:city)

users = [
  User.new("Ann", Address.new("Paris")),
  User.new("Bob", nil),
  nil
]

users.each do |u|
  puts u&.address&.city.inspect
end

puts (users[1]&.address&.city || "unknown")
puts users.compact.map { |u| u.address&.city }.compact.inspect

config = { db: { host: "localhost" } }
puts config.dig(:db, :host)
puts config.dig(:cache, :host).inspect
puts config.fetch(:cache, "none")
nums = nil
puts nums.to_a.inspect
puts nums.to_s.empty?
