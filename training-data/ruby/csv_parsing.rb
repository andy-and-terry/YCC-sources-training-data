require 'csv'

data = "name,age\nAlice,30\nBob,25\n"
rows = CSV.parse(data, headers: true)
rows.each { |row| puts "#{row['name']} is #{row['age']}" }
