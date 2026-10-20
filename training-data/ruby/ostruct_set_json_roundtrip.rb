require "json"
require "ostruct"
require "set"

os = OpenStruct.new(name: "x", n: 1)
os.extra = [1, 2]
puts os.to_h.to_json
data = JSON.parse('{"a":{"b":[1,2,{"c":3}]}}', symbolize_names: true)
puts data.dig(:a, :b, 2, :c)
s = Set[1, 2, 3]
puts (s | Set[3, 4]).to_a.inspect, s.subset?(Set[1, 2, 3, 4]), JSON.pretty_generate({k: [1, 2]})
