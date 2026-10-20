protocol Describable {
    var name: String { get }
    func describe() -> String
}

extension Describable {
    func describe() -> String { "I am \(name)" }
}

struct Cat: Describable { let name: String }
struct Robot: Describable {
    let name: String
    func describe() -> String { "Beep, \(name)" }
}

let items: [Describable] = [Cat(name: "Tom"), Robot(name: "R2")]
items.forEach { print($0.describe()) }

extension Collection where Element: Numeric {
    var total: Element { reduce(0, +) }
}
print([1, 2, 3].total, [1.5, 2.5].total)
