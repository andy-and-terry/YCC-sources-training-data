final class LFUCache {
    private var capacity: Int
    private var values: [Int: Int] = [:]
    private var freqs: [Int: Int] = [:]
    private var freqGroups: [Int: [Int]] = [:]
    private var minFreq = 0

    init(capacity: Int) {
        self.capacity = capacity
    }

    private func touch(_ key: Int) {
        let freq = freqs[key] ?? 0
        freqs[key] = freq + 1
        freqGroups[freq]?.removeAll { $0 == key }
        if freqGroups[freq]?.isEmpty == true && minFreq == freq {
            minFreq += 1
        }
        freqGroups[freq + 1, default: []].append(key)
    }

    func get(_ key: Int) -> Int? {
        guard let value = values[key] else { return nil }
        touch(key)
        return value
    }

    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if values[key] != nil {
            values[key] = value
            touch(key)
            return
        }
        if values.count >= capacity, let evictKey = freqGroups[minFreq]?.first {
            freqGroups[minFreq]?.removeFirst()
            values.removeValue(forKey: evictKey)
            freqs.removeValue(forKey: evictKey)
        }
        values[key] = value
        freqs[key] = 0
        freqGroups[0, default: []].append(key)
        minFreq = 0
    }
}

let cache = LFUCache(capacity: 2)
cache.put(1, 10)
cache.put(2, 20)
print(cache.get(1) as Any)
cache.put(3, 30)
print(cache.get(2) as Any)
print(cache.get(3) as Any)
