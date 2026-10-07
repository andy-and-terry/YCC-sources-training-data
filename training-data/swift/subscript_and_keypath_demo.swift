struct Matrix {
    let rows: Int
    let columns: Int
    private var storage: [Double]

    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        self.storage = Array(repeating: 0.0, count: rows * columns)
    }

    subscript(row: Int, column: Int) -> Double {
        get { storage[row * columns + column] }
        set { storage[row * columns + column] = newValue }
    }
}

var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 0] = 1
matrix[0, 1] = 2
matrix[1, 0] = 3
matrix[1, 1] = 4
print(matrix[1, 1]) // 4.0

struct Person {
    let name: String
    let age: Int
}

let people = [Person(name: "Ada", age: 36), Person(name: "Grace", age: 45)]
let nameKeyPath = \Person.name
let ageKeyPath = \Person.age

print(people.map { $0[keyPath: nameKeyPath] })
print(people.map { $0[keyPath: ageKeyPath] })

func sorted<Value: Comparable>(_ people: [Person], by keyPath: KeyPath<Person, Value>) -> [Person] {
    people.sorted { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
}

print(sorted(people, by: \.age).map(\.name))
