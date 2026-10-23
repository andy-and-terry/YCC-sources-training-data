let name = "Swift"
let version = 5.9
let items = ["a", "b", "c"]

print("Hello, \(name) \(version)")
print("count: \(items.count), joined: \(items.joined(separator: "-"))")
print("sum: \(1 + 2 * 3)")

let multi = """
    Line one
      indented two
    Line three
    """
print(multi)
print(String(repeating: "=", count: 10))
print(String(format: "%05.1f|%-4d|", 3.14159, 42))
