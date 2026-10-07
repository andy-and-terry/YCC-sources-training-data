data = {
  user: { name: "Ann", langs: ["ruby", "go"], address: { city: "Rome" } },
  tags: []
}

puts data.dig(:user, :address, :city)
puts data.dig(:user, :langs, 1)
puts data.dig(:user, :phone, :home).inspect
puts data[:tags].first.inspect

puts data.fetch(:tags).inspect
puts data.fetch(:missing, "default")
puts data.fetch(:missing) { |k| "computed for #{k}" }

begin
  data.fetch(:missing)
rescue KeyError => e
  puts "KeyError: #{e.message}"
end

arr = [10, 20, 30]
puts arr.fetch(1), arr.fetch(10, :none)
begin
  arr.fetch(10)
rescue IndexError => e
  puts "IndexError: #{e.message}"
end

puts data.values_at(:tags, :nope).inspect
puts data.fetch_values(:tags).inspect
puts arr.values_at(0, 2, 5).inspect
puts arr.dig(0), data.key?(:user), data[:user].member?(:name)
