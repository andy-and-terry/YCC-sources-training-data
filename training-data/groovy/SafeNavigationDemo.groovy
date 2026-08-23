class Address {
    String city
}

class Person {
    String name
    Address address
}

def alice = new Person(name: "Alice", address: new Address(city: "NYC"))
def bob = new Person(name: "Bob")

println alice?.address?.city
println bob?.address?.city
println (bob?.address?.city ?: "Unknown")
