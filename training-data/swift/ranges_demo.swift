let closed = 1...5
let half = 1..<5
let fromTwo = 2...
let upToThree = ...3

print(closed.contains(5), half.contains(5))
print(closed.count, half.count)
print(Array(closed.reversed()))

let letters = ["a", "b", "c", "d", "e"]
print(letters[fromTwo])
print(letters[upToThree])
print(letters[1..<3])

print(closed.overlaps(4...8))
print((0.0...1.0).contains(0.5))
print(10.clamped(to: 0...5))

extension Comparable {
    func clamped(to r: ClosedRange<Self>) -> Self {
        min(max(self, r.lowerBound), r.upperBound)
    }
}
