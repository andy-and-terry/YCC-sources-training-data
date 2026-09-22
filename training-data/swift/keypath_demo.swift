struct Employee {
    let name: String
    let age: Int
    let salary: Double
}

let employees = [
    Employee(name: "Ada", age: 36, salary: 95_000),
    Employee(name: "Bob", age: 29, salary: 72_000),
    Employee(name: "Cleo", age: 41, salary: 110_000)
]

let names = employees.map(\.name)
print(names)

let sortedByAge = employees.sorted(by: { $0.age < $1.age })
print(sortedByAge.map(\.name))

let ageKeyPath: KeyPath<Employee, Int> = \.age
let ages = employees.map { $0[keyPath: ageKeyPath] }
print(ages)

func sorted<Root, Value: Comparable>(_ items: [Root], by keyPath: KeyPath<Root, Value>) -> [Root] {
    items.sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
}

let bySalary = sorted(employees, by: \.salary)
print(bySalary.map(\.name))

@dynamicMemberLookup
struct JSONBag {
    private var storage: [String: Any]

    init(_ storage: [String: Any]) {
        self.storage = storage
    }

    subscript(dynamicMember member: String) -> Any? {
        storage[member]
    }
}

let bag = JSONBag(["title": "Engineer", "level": 5])
print(bag.title ?? "unknown")
print(bag.level ?? -1)
