@dynamicMemberLookup
struct Config {
    private var values: [String: String]

    init(_ values: [String: String]) {
        self.values = values
    }

    subscript(dynamicMember key: String) -> String {
        values[key] ?? "<unset>"
    }
}

let config = Config(["host": "localhost", "port": "8080"])
print(config.host)
print(config.port)
print(config.timeout)
