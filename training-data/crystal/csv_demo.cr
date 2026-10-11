require "csv"

data = "name,age,city\nAda,36,London\nLinus,54,\"Portland, OR\"\n"

rows = CSV.parse(data)
puts rows.size
puts rows[2][2]

CSV.parse(data, headers: true).each do |row|
  puts "#{row["name"]} is #{row["age"]}"
end

out = CSV.build do |csv|
  csv.row "id", "note"
  csv.row 1, "plain"
  csv.row 2, "has, comma"
end
puts out
