text = "The year 1999 and the year 2024 had 3 events."

puts text.gsub(/\d+/) { |n| (n.to_i + 1).to_s }
puts text.gsub(/year (\d+)/, 'Y\1')
puts text.gsub(/(?<y>\d{4})/, '[\k<y>]')
puts text.sub("year", "YEAR")
puts "cat hat".gsub(/[ch]at/, "cat" => "dog", "hat" => "cap")
puts "hello world".gsub(/o/, "o" => "0")
puts "snake_case_name".gsub(/_(\w)/) { $1.upcase }
puts "CamelCaseName".gsub(/([A-Z])/) { "_" + $1.downcase }.sub(/\A_/, "")

puts text.scan(/\d+/).inspect
puts text.scan(/(\w+) (\d+)/).inspect
puts text =~ /\d{4}/, $~[0], $`.length
puts text.match(/(?<first>\d+).*(?<second>\d+)/)[:first]
puts "a1b22".tr("0-9", "#"), "hello".delete("l"), "aaabbb".squeeze
puts "x-y_z".split(/[-_]/).inspect
puts "  pad ".strip.center(9, "-")
