import std/algorithm

type Employee = object
  name: string
  dept: string
  salary: int

var staff = @[
  Employee(name: "Cleo", dept: "eng", salary: 120),
  Employee(name: "Ada", dept: "eng", salary: 150),
  Employee(name: "Bob", dept: "ops", salary: 90),
  Employee(name: "Dan", dept: "ops", salary: 90),
  Employee(name: "Eve", dept: "eng", salary: 120),
]

# department ascending, salary descending, then name ascending
staff.sort(proc (x, y: Employee): int =
  result = cmp(x.dept, y.dept)
  if result == 0: result = cmp(y.salary, x.salary)
  if result == 0: result = cmp(x.name, y.name))

for e in staff:
  echo e.dept, " ", e.salary, " ", e.name

echo staff.isSorted(proc (x, y: Employee): int = cmp(x.dept, y.dept))
