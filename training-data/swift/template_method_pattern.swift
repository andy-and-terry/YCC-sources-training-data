protocol DataExporter {
    func fetchData() -> [String]
    func format(_ rows: [String]) -> String
    func header() -> String
}

extension DataExporter {
    func export() -> String {
        let rows = fetchData()
        return header() + "\n" + format(rows)
    }
}

struct CSVExporter: DataExporter {
    func fetchData() -> [String] { ["a,1", "b,2", "c,3"] }
    func header() -> String { "name,value" }
    func format(_ rows: [String]) -> String { rows.joined(separator: "\n") }
}

struct JSONExporter: DataExporter {
    func fetchData() -> [String] { ["a", "b", "c"] }
    func header() -> String { "// generated export" }
    func format(_ rows: [String]) -> String {
        "[" + rows.map { "\"\($0)\"" }.joined(separator: ",") + "]"
    }
}

let exporters: [DataExporter] = [CSVExporter(), JSONExporter()]
for exporter in exporters {
    print(exporter.export())
    print("---")
}
