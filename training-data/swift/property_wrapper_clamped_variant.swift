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

struct Volume { @Clamped(0...10) var level = 5 }
var v = Volume()
v.level = 99
print(v.level)
