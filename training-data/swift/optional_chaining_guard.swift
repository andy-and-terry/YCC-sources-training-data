struct Address { var city: String? }
struct Person { var address: Address? }

func city(of p: Person?) -> String {
    guard let c = p?.address?.city else { return "unknown" }
    return c
}

print(city(of: Person(address: Address(city: "Paris"))))
print(city(of: nil))
