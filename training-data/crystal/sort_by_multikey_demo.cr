# Sorting with sort_by, tuples as composite keys, and <=>.
record Person, name : String, age : Int32

people = [
  Person.new("Ann", 30), Person.new("Bob", 25),
  Person.new("Cy", 30), Person.new("Al", 25),
]

sorted = people.sort_by { |p| {-p.age, p.name} }
sorted.each { |p| puts "#{p.name} #{p.age}" }

p people.sort { |a, b| a.age == b.age ? a.name <=> b.name : a.age <=> b.age }.map(&.name)
p people.min_by(&.age).name
p people.max_by(&.name).name
p people.group_by(&.age).transform_values(&.size)
