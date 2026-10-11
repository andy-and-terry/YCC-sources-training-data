name = "Crystal"
version = 1.14

text = <<-TEXT
  Language: #{name}
  Version:  #{version}
  Sum:      #{1 + 2}
  TEXT
puts text

raw = <<-'RAW'
  No #{interpolation} here\n
  RAW
puts raw

sql = <<-SQL.strip.gsub(/\s+/, " ")
  SELECT *
    FROM users
   WHERE age > 18
  SQL
puts sql

puts "tab\tseparated", 'single #{not}'
puts "multi
line"
