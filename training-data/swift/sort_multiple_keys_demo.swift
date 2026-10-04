struct Employee {
    let name: String
    let dept: String
    let salary: Int
}

let staff = [
    Employee(name: "Cy", dept: "ops", salary: 70),
    Employee(name: "Ann", dept: "eng", salary: 90),
    Employee(name: "Bob", dept: "eng", salary: 90),
    Employee(name: "Dee", dept: "ops", salary: 85),
    Employee(name: "Eve", dept: "eng", salary: 100),
]

let byDeptThenSalary = staff.sorted {
    if $0.dept != $1.dept { return $0.dept < $1.dept }
    if $0.salary != $1.salary { return $0.salary > $1.salary }
    return $0.name < $1.name
}
print(byDeptThenSalary.map(\.name))

let tupleCompare = staff.sorted { (a, b) in
    (a.dept, -a.salary, a.name) < (b.dept, -b.salary, b.name)
}
print(tupleCompare.map(\.name))

print(staff.sorted { $0.name > $1.name }.map(\.name))
print(staff.max { $0.salary < $1.salary }!.name)
print(staff.min { $0.salary < $1.salary }!.name)

var numbers = [5, 3, 9, 1, 7]
numbers.sort(by: >)
print(numbers)
numbers.sort()
print(numbers)

let words = ["banana", "Apple", "cherry", "apple"]
print(words.sorted())
print(words.sorted { $0.lowercased() < $1.lowercased() })
print(words.sorted { $0.count != $1.count ? $0.count < $1.count : $0 < $1 })
print(words.sorted(by: { $0.localizedLowercase < $1.localizedLowercase }).first!)
