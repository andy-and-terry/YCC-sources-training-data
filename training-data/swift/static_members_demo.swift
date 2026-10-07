struct Config {
    static let defaultName = "app"
    static var instanceCount = 0

    let name: String
    let id: Int

    init(name: String = Config.defaultName) {
        Config.instanceCount += 1
        self.name = name
        self.id = Config.instanceCount
    }

    static func reset() {
        instanceCount = 0
    }

    static let production = Config(name: "prod")
}

let a = Config()
let b = Config(name: "custom")
print(a.name, a.id, b.name, b.id)
print(Config.instanceCount)
print(Config.production.name)
Config.reset()
print(Config.instanceCount)
