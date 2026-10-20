require "json"
require "file_utils"

path = File.join(Dir.tempdir, "cr_demo.txt")
File.write(path, "line one\nline two\n")
File.open(path, "a") { |f| f.puts "line three" }
puts File.read_lines(path).size, File.size(path), File.exists?(path), File.basename(path), File.extname(path)
File.each_line(path) { |l| puts l.upcase }
File.delete(path)
puts File.exists?(path)

struct Item
  include JSON::Serializable
  property name : String
  property qty : Int32
  @[JSON::Field(key: "unit_price")]
  property price : Float64
end

json = %({"name": "pen", "qty": 3, "unit_price": 1.5})
item = Item.from_json(json)
puts item.name, item.qty * item.price, item.to_json
data = JSON.parse(%({"a": {"b": [1, 2, 3]}}))
puts data["a"]["b"][1].as_i, data["a"]["b"].as_a.size
puts({"x" => 1, "y" => [true, nil]}.to_json)
t = Time.utc(2024, 2, 28, 12, 30)
puts t.to_s("%Y-%m-%d %H:%M"), (t + 2.days).to_s("%F"), t.day_of_week, (Time.utc(2024, 12, 25) - t).total_days.to_i
puts Time.parse_utc("2024-03-05", "%F").month, Time::Span.new(hours: 1, minutes: 30).total_minutes
