struct Address {
    var city: String
}

struct Company {
    var address: Address?
}

struct Employee {
    var company: Company?
}

func cityOf(_ employee: Employee) -> String {
    employee.company?.address?.city ?? "unknown"
}

let e1 = Employee(company: Company(address: Address(city: "Berlin")))
let e2 = Employee(company: Company(address: nil))
let e3 = Employee(company: nil)

print(cityOf(e1))
print(cityOf(e2))
print(cityOf(e3))
