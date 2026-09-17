function describe(person::NamedTuple)
    return "$(person.name) is $(person.age) years old"
end

alice = (name = "Alice", age = 30)
bob = (name = "Bob", age = 25)

println(describe(alice))
println(describe(bob))

(; name, age) = alice
println("$name -> $age")

people = [alice, bob]
oldest = argmax(p -> p.age, people)
println(oldest.name)
