@propertyWrapper
struct Clamped {
    private var v: Int
    let range: ClosedRange<Int>
    init(wrappedValue: Int, _ range: ClosedRange<Int>) {
        self.range = range
        self.v = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }
    var wrappedValue: Int {
        get { v }
        set { v = min(max(newValue, range.lowerBound), range.upperBound) }
    }
}

struct Volume { @Clamped(0...10) var level = 5 }
var v = Volume()
v.level = 42
print(v.level)
