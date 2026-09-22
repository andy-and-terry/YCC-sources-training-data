func processFile(named name: String, shouldFail: Bool) -> String {
    print("opening \(name)")
    defer {
        print("closing \(name)")
    }

    if shouldFail {
        return "failed to process \(name)"
    }

    defer {
        print("cleanup after successful processing")
    }

    return "processed \(name)"
}

print(processFile(named: "data.txt", shouldFail: false))
print("---")
print(processFile(named: "broken.txt", shouldFail: true))
