text = "Order 66 shipped 3 items on 2024-05-17"

puts text.gsub(/\d+/) { |m| "<#{m}>" }
puts text.gsub("items", "boxes")

numbers = text.scan(/\d+/).map(&.[0].to_i)
puts numbers.inspect

puts text.sub(/(\d{4})-(\d{2})-(\d{2})/, "\\3/\\2/\\1")

puts "snake_case_name".split('_').map_with_index { |w, i| i.zero? ? w : w.capitalize }.join
puts "Hello World".tr("lo", "01")
puts "  padded  ".strip.center(12, '*')
