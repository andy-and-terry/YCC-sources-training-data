Person = Struct.new(:name, :age, :city)

people = [
  Person.new("Ann", 31, "Oslo"),
  Person.new("Bob", 25, "Rome"),
  Person.new("Cid", 31, "Bern"),
  Person.new("Dee", 25, "Oslo")
]

puts people.sort_by { |p| [-p.age, p.name] }.map(&:name).inspect
puts people.min_by(&:age).name
puts people.max_by(2, &:age).map(&:name).inspect
puts people.group_by(&:city).transform_values { |v| v.map(&:name) }.inspect
puts people.partition { |p| p.age > 30 }.map { |g| g.map(&:name) }.inspect
puts people.sum(&:age) / people.size.to_f
p people.each_slice(2).map { |pair| pair.map(&:name) }
p people.each_cons(2).count { |a, b| a.age == b.age }
