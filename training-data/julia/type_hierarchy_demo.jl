abstract type Animal end

struct Dog <: Animal
    name::String
end

struct Cat <: Animal
    name::String
end

speak(a::Dog) = "$(a.name) barks"
speak(a::Cat) = "$(a.name) meows"

animals = [Dog("Rex"), Cat("Whiskers")]
for a in animals
    println(speak(a))
end
