class Box {
    var value = 1
    lazy var printer: () -> Void = { [weak self] in
        guard let self = self else { return }
        print("value:", self.value)
    }
}

let b = Box()
b.printer()
b.value = 5
b.printer()
let adders = (1...3).map { n in { (x: Int) in x + n } }
print(adders.map { $0(10) })
