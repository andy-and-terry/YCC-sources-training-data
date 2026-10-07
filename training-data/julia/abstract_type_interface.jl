abstract type Animal end

struct Dog <: Animal
    name::String
end
struct Cat <: Animal
    name::String
end

speak(a::Animal) = error("speak not implemented for $(typeof(a))")
speak(d::Dog) = "$(d.name) says woof"
speak(c::Cat) = "$(c.name) says meow"

struct Fish <: Animal end

for a in Animal[Dog("Rex"), Cat("Tom"), Fish()]
    try
        println(speak(a))
    catch e
        println("error: ", e.msg)
    end
end

println(Dog <: Animal, " ", supertype(Dog), " ", subtypes(Animal))
println(isa(Dog("a"), Animal), " ", hasmethod(speak, Tuple{Dog}))
