Person = Struct.new(:name, :age)

people = [Person.new("Cy", 40), Person.new("Ann", 31), Person.new("Bob", 31)]

puts people.sort_by { |p| [p.age, p.name] }.map(&:name).inspect
puts people.sort_by { |p| [-p.age, p.name] }.map(&:name).inspect
puts people.max_by(&:age).name
puts people.minmax_by(&:name).map(&:name).inspect
puts people.partition { |p| p.age > 35 }.map { |g| g.map(&:name) }.inspect
puts people.sum(&:age)
puts people.each_slice(2).map { |s| s.map(&:name) }.inspect
puts people.each_cons(2).map { |a, b| b.age - a.age }.inspect
puts [3, 1, 2].sort { |a, b| b <=> a }.inspect
puts %w[pear fig apple].sort_by(&:length).inspect
