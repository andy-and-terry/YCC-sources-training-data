class Person
  def initialize(name, age)
    @name = name
    @age = age
  end
end

p1 = Person.new("Ann", 30)
puts p1.instance_variables.inspect
puts p1.instance_variable_get(:@name)
p1.instance_variable_set(:@age, 31)
p1.instance_variable_set(:@email, "a@x.io")
puts p1.instance_variables.inspect
puts p1.instance_variable_defined?(:@email)
p1.remove_instance_variable(:@email)
puts p1.instance_variable_defined?(:@email)

state = p1.instance_variables.to_h { |v| [v.to_s.delete("@"), p1.instance_variable_get(v)] }
puts state.inspect

clone = Person.allocate
state.each { |k, v| clone.instance_variable_set("@#{k}", v) }
puts clone.instance_variable_get(:@age)
