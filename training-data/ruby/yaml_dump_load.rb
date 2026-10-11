require "yaml"

data = { "name" => "app", "ports" => [80, 443], "opts" => { "debug" => true, "ratio" => 0.5 } }
yml = data.to_yaml
puts yml
back = YAML.safe_load(yml)
puts back == data

puts YAML.load("- a\n- b\n- 3").inspect
puts YAML.safe_load("key: value\nnum: 10\nnil_val: ~\n").inspect
puts YAML.safe_load(":sym: 1", permitted_classes: [Symbol]).inspect rescue puts "needs permitted symbol"
puts YAML.safe_load("a: &x [1, 2]\nb: *x", aliases: true).inspect
begin
  YAML.safe_load("--- !ruby/object:Object {}")
rescue Psych::DisallowedClass => e
  puts "blocked: #{e.class}"
end
puts({ a: 1 }.to_yaml)
