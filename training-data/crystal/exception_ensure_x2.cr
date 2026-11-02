begin
  Int32.new("abc")
rescue ex : ArgumentError
  puts "bad: #{ex.message}"
ensure
  puts "always"
end
