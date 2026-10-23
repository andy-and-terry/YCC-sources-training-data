@propertyWrapper
struct Tracked<Value> {
    private var value: Value
    private(set) var history: [Value] = []

    init(wrappedValue: Value) {
        self.value = wrappedValue
    }

    var wrappedValue: Value {
        get { value }
        set {
            history.append(value)
            value = newValue
        }
    }

    // Accessed with the $ prefix on the property.
    var projectedValue: [Value] {
        history
    }
}

struct Thermostat {
    @Tracked var target: Int = 20
}

var thermostat = Thermostat()
thermostat.target = 22
thermostat.target = 19
thermostat.target = 21

print("current: \(thermostat.target)")
print("previous values: \(thermostat.$target)")
print("changes made: \(thermostat.$target.count)")
