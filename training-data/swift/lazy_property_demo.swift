final class Report {
    let title: String

    lazy var body: String = {
        print("computing body...")
        return (1...3).map { "line \($0)" }.joined(separator: "\n")
    }()

    init(title: String) {
        self.title = title
    }
}

let r = Report(title: "Monthly")
print("created", r.title)
print(r.body)
print(r.body)
