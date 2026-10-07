text = "Order 12 shipped on 2024-03-09, order 345 on 2024-04-01."

puts text.scan(/\d+/).inspect
puts text.scan(/(\d{4})-(\d{2})-(\d{2})/).inspect
puts text.gsub(/\d+/) { |n| (n.to_i * 2).to_s }
puts text.gsub(/(\d{4})-(\d{2})-(\d{2})/, '\3/\2/\1')
puts "snake_case_word".gsub(/_(\w)/) { $1.upcase }
puts "hello world".tr('lo', '01')
puts "a1b22c333".split(/\d+/).inspect
if (m = text.match(/(?<id>\d+) shipped/))
  puts m[:id]
end
