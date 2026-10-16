struct Employee {
    let name: String
    let dept: String
    let salary: Int
}

let staff = [
    Employee(name: "Zed", dept: "ops", salary: 70),
    Employee(name: "Amy", dept: "eng", salary: 120),
    Employee(name: "Bob", dept: "eng", salary: 100),
    Employee(name: "Cat", dept: "ops", salary: 80)
]

let bySalary = staff.sorted { $0.salary > $1.salary }
print(bySalary.map(\.name))

let grouped = Dictionary(grouping: staff, by: \.dept)
for dept in grouped.keys.sorted() {
    let total = grouped[dept]!.reduce(0) { $0 + $1.salary }
    print("\(dept): \(total)")
}
print(staff.map(\.salary).max() as Any)
