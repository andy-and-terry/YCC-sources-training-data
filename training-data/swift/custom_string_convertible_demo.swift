struct Point: CustomStringConvertible, CustomDebugStringConvertible {
    var x: Int
    var y: Int

    var description: String { "(\(x), \(y))" }
    var debugDescription: String { "Point(x: \(x), y: \(y))" }
}

let p = Point(x: 3, y: -4)
print(p)
print("point is \(p)")
debugPrint(p)
print(String(describing: p))
print(String(reflecting: p))
print([p, Point(x: 0, y: 0)])
