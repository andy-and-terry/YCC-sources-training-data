@propertyWrapper
struct Clamped {
    private var value: Int
    let range: ClosedRange<Int>
    init(wrappedValue: Int, _ range: ClosedRange<Int>) {
        self.range = range
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
    var wrappedValue: Int {
        get { value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }
}

struct Player {
    @Clamped(0...100) var health = 150
    var score = 0 {
        willSet { print("will set to \(newValue)") }
        didSet { print("changed from \(oldValue)") }
    }
}

var p = Player()
print(p.health)
p.health -= 500
print(p.health)
p.score = 10
