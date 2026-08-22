def create_user(name:, age: 18, active: true)
  { name: name, age: age, active: active }
end

puts create_user(name: 'Alice').inspect
puts create_user(name: 'Bob', age: 25, active: false).inspect
