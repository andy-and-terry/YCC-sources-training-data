@propertyWrapper
struct Clamped<Value: Comparable> {
    private var value: Value
    let range: ClosedRange<Value>

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = min(max(wrappedValue, range.lowerBound), range.upperBound)
    }

    var wrappedValue: Value {
        get { value }
        set { value = min(max(newValue, range.lowerBound), range.upperBound) }
    }
}

struct Speaker {
    @Clamped(0...100) var volume = 50
    @Clamped(0.5...2.0) var speed = 1.0
}

var s = Speaker()
s.volume = 150
s.speed = 0.1
print(s.volume, s.speed)
