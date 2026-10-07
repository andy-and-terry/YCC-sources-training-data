abstract type Animal end
abstract type Pet <: Animal end

struct Dog <: Pet
    name::String
end
struct Cat <: Pet
    name::String
end
struct Wolf <: Animal end

speak(::Dog) = "Woof"
speak(::Cat) = "Meow"
speak(::Animal) = "..."

describe(p::Pet) = "$(p.name) says $(speak(p))"
describe(a::Animal) = "A wild animal says $(speak(a))"

for a in (Dog("Rex"), Cat("Tom"), Wolf())
    println(describe(a))
end

println(supertype(Dog), " ", supertypes(Dog))
println(subtypes(Animal))
println(Dog <: Animal, " ", isabstracttype(Pet))
