struct Report {
    let rows: [Int]

    lazy var total: Int = {
        print("computing total")
        return rows.reduce(0, +)
    }()

    init(rows: [Int]) {
        self.rows = rows
    }
}

class Loader {
    var loads = 0

    lazy var config: [String: String] = {
        loads += 1
        print("loading config")
        return ["mode": "fast", "level": "3"]
    }()

    lazy var banner: String = "Loader (\(config.count) settings)"
}

var report = Report(rows: [1, 2, 3, 4])
print("report created")
print(report.total)
print(report.total)

let loader = Loader()
print("loader created, loads = \(loader.loads)")
print(loader.banner)
print(loader.config["mode"] ?? "?")
print("loads = \(loader.loads)")

let numbers = [1, 2, 3, 4, 5, 6]
let pipeline = numbers.lazy
    .map { n -> Int in print("map \(n)"); return n * 2 }
    .filter { $0 % 4 == 0 }
print("pipeline built")
print(Array(pipeline.prefix(1)))
