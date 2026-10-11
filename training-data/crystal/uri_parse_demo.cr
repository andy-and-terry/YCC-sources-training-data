require "uri"

u = URI.parse("https://user@example.com:8443/path/to/page?q=crystal&page=2#top")

puts u.scheme
puts u.host
puts u.port
puts u.path
puts u.query
puts u.fragment
puts u.user

params = URI::Params.parse(u.query.not_nil!)
puts params["q"]
puts params["page"].to_i + 1

puts URI.encode_www_form_component("a b&c=d")
puts URI.decode_www_form_component("a+b%26c")
puts URI::Params.encode({"x" => "1", "y" => "two words"})
