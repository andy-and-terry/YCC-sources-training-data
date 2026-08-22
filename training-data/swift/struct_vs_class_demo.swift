struct PointValue {
    var x: Int
    var y: Int
}

final class PointRef {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

func mutateValue(_ p: PointValue) -> PointValue {
    var copy = p
    copy.x += 10
    return copy
}

func mutateRef(_ p: PointRef) {
    p.x += 10
}

var original = PointValue(x: 1, y: 1)
let mutated = mutateValue(original)
print(original.x, mutated.x)

let ref = PointRef(x: 1, y: 1)
mutateRef(ref)
print(ref.x)
