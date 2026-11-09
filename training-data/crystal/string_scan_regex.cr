text = "a1 b22 c333"
text.scan(/([a-z])(\d+)/) do |m|
  puts "#{m[1]} -> #{m[2]}"
end
