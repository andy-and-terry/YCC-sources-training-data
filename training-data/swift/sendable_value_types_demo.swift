import Foundation

// Value types made of Sendable members are safe to share across tasks.
struct Reading: Sendable {
    let sensor: String
    let value: Double
}

// A final class with immutable state can also conform to Sendable.
final class Config: Sendable {
    let name: String
    let threshold: Double
    init(name: String, threshold: Double) {
        self.name = name
        self.threshold = threshold
    }
}

func process(_ readings: [Reading], config: Config) async -> [String] {
    await withTaskGroup(of: String?.self) { group in
        for reading in readings {
            group.addTask {
                reading.value > config.threshold
                    ? "\(reading.sensor) exceeded \(config.name)"
                    : nil
            }
        }
        var alerts: [String] = []
        for await alert in group {
            if let alert { alerts.append(alert) }
        }
        return alerts.sorted()
    }
}

let config = Config(name: "limit", threshold: 50)
let readings = [
    Reading(sensor: "A", value: 42.5),
    Reading(sensor: "B", value: 73.1),
    Reading(sensor: "C", value: 88.0),
]

let task = Task {
    let alerts = await process(readings, config: config)
    for alert in alerts { print(alert) }
}
_ = await task.value
