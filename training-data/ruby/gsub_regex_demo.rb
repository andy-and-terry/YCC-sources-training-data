text = "Contact: alice@example.com, bob@test.org on 2024-03-15"

emails = text.scan(/\b[\w.]+@[\w.]+\.\w+\b/)
p emails

if (m = text.match(/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/))
  puts "#{m[:day]}/#{m[:month]}/#{m[:year]}"
end

puts text.gsub(/(\w+)@(\w+)/) { "#{$1.upcase}@#{$2}" }
puts text.sub(/\d{4}-\d{2}-\d{2}/) { |d| d.tr("-", "/") }
puts "snake_case_word".gsub(/_(\w)/) { $1.upcase }
puts "CamelCaseWord".gsub(/([A-Z])/) { "_" + $1.downcase }.sub(/^_/, "")
puts "a1b22c333".gsub(/\d+/, "1" => "one", "22" => "two")
