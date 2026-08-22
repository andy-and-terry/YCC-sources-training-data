require 'json'

data = { name: 'Alice', age: 30, tags: %w[admin user] }
json_text = data.to_json
puts json_text

parsed = JSON.parse(json_text, symbolize_names: true)
puts parsed[:name]
