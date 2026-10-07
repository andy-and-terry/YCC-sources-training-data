Employee = Struct.new(:name, :department, :salary, keyword_init: true) do
  def raise_salary(percent)
    self.salary += salary * percent / 100.0
  end
end

alice = Employee.new(name: 'Alice', department: 'Engineering', salary: 90_000)
puts alice.to_h
puts alice.members.inspect

alice.raise_salary(10)
puts alice.salary

alice.each_pair { |field, value| puts "#{field}: #{value}" }

bob = Employee.new(name: 'Bob', department: 'Engineering', salary: 90_000)
puts alice == bob
