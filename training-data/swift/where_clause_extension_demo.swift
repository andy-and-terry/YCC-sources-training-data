extension Array where Element == String {
    func longest() -> String? {
        self.max { $0.count < $1.count }
    }
}

extension Array where Element: Equatable {
    func indexesOf(_ target: Element) -> [Int] {
        enumerated().filter { $0.element == target }.map(\.offset)
    }
}

extension Optional where Wrapped == String {
    var orEmpty: String { self ?? "" }
}

print(["hi", "hello", "hey"].longest() as Any)
print([1, 2, 1, 3, 1].indexesOf(1))
let missing: String? = nil
print("[\(missing.orEmpty)]")
