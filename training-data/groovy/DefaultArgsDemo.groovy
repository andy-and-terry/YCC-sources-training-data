def greet(String name, String greeting = "Hello") {
    return "${greeting}, ${name}!"
}

println greet("World")
println greet("World", "Hi")
