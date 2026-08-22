final class Logger {
    static let shared = Logger()
    private var messages: [String] = []

    private init() {}

    func log(_ message: String) {
        messages.append(message)
    }

    func history() -> [String] {
        messages
    }
}

Logger.shared.log("started")
Logger.shared.log("processing")
print(Logger.shared.history())
