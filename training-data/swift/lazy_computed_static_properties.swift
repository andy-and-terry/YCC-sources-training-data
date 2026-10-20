struct Temp {
    static let freezing = 32.0
    static var instances = 0
    var celsius: Double { didSet { Temp.instances += 1 } }
    var fahrenheit: Double {
        get { celsius * 9 / 5 + 32 }
        set { celsius = (newValue - 32) * 5 / 9 }
    }
}
var t = Temp(celsius: 100)
t.fahrenheit = Temp.freezing
print(t.celsius, Temp.instances)

final class Loader {
    lazy var data: [Int] = { print("loading"); return [1, 2, 3] }()
}
let l = Loader()
print(l.data.count, l.data.count)
