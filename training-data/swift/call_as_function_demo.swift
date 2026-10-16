struct Multiplier {
    let factor: Int

    func callAsFunction(_ x: Int) -> Int {
        x * factor
    }
}

let triple = Multiplier(factor: 3)
print(triple(7))
print([1, 2, 3].map(triple))
