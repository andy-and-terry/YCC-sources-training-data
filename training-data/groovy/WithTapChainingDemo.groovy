// with() runs a closure against the receiver and returns the closure's result;
// tap() does the same but returns the receiver itself, which suits chaining.
class Person {
    String name
    int age
    List<String> tags = []

    String toString() { "$name ($age) $tags" }
}

// tap: configure and get the object back
def ann = new Person().tap {
    name = 'Ann'
    age = 30
    tags << 'admin'
}
println ann

// with: the value of the last expression is returned
def summary = ann.with { "${name.toUpperCase()} is ${age}" }
println summary

// with can also read a property of the object while mutating it
def older = ann.with {
    age += 1
    age
}
println older

// tap on a collection mutates and returns the same list
def nums = [3, 1, 2].tap { sort(); add(10) }
println nums

// tap for debugging in the middle of a pipeline
def result = (1..6)
    .findAll { it % 2 == 0 }
    .tap { println "evens: $it" }
    .collect { it * it }
println result

// with on a map delegates property access to keys
def config = [host: 'localhost', port: 8080]
println config.with { "$host:$port" }
