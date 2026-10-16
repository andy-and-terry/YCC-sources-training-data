struct Car {
    let make: String
    let year: Int
    var mileage: Double
}

let car = Car(make: "Volvo", year: 2019, mileage: 54_200.5)
let mirror = Mirror(reflecting: car)

print(mirror.subjectType)
for child in mirror.children {
    print("\(child.label ?? "?") = \(child.value)")
}
print(mirror.children.count)
