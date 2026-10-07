struct Thermostat {
    var temperature: Int = 70 {
        willSet {
            print("about to change from \(temperature) to \(newValue)")
        }
        didSet {
            if temperature > oldValue {
                print("warming up to \(temperature)")
            } else if temperature < oldValue {
                print("cooling down to \(temperature)")
            }
        }
    }
}

var thermostat = Thermostat()
thermostat.temperature = 75
thermostat.temperature = 68
