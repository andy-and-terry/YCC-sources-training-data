struct Employee {
    let name: String
    let dept: String
    let salary: Int
}

let staff = [
    Employee(name: "Ann", dept: "Eng", salary: 120),
    Employee(name: "Bob", dept: "Ops", salary: 90),
    Employee(name: "Cy", dept: "Eng", salary: 150),
    Employee(name: "Di", dept: "Ops", salary: 90),
]

let sorted = staff.sorted { l, r in
    if l.dept != r.dept { return l.dept < r.dept }
    if l.salary != r.salary { return l.salary > r.salary }
    return l.name < r.name
}
for e in sorted { print(e.dept, e.salary, e.name) }

let byTuple = staff.sorted { ($0.salary, $0.name) < ($1.salary, $1.name) }
print(byTuple.map(\.name))
