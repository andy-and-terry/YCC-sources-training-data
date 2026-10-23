struct Address { var city: String? }
struct User { var address: Address? }

let u1 = User(address: Address(city: "Oslo"))
let u2 = User(address: nil)

print(u1.address?.city ?? "unknown")
print(u2.address?.city ?? "unknown")

func greet(_ name: String?) {
    guard let name = name, !name.isEmpty else {
        print("no name")
        return
    }
    print("hello \(name)")
}

greet("Sam")
greet(nil)
greet("")
