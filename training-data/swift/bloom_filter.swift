import Foundation

struct BloomFilter {
    private var bits: [Bool]
    private let size: Int
    private let seeds: [Int]

    init(size: Int, hashCount: Int) {
        self.size = size
        self.bits = [Bool](repeating: false, count: size)
        self.seeds = (0..<hashCount).map { $0 * 31 + 7 }
    }

    private func hash(_ value: String, seed: Int) -> Int {
        var h = seed
        for byte in value.utf8 {
            h = (h &* 31) &+ Int(byte)
        }
        return abs(h) % size
    }

    mutating func insert(_ value: String) {
        for seed in seeds {
            bits[hash(value, seed: seed)] = true
        }
    }

    func mightContain(_ value: String) -> Bool {
        for seed in seeds {
            if !bits[hash(value, seed: seed)] {
                return false
            }
        }
        return true
    }
}

var filter = BloomFilter(size: 64, hashCount: 3)
filter.insert("apple")
filter.insert("banana")

print(filter.mightContain("apple"))
print(filter.mightContain("banana"))
print(filter.mightContain("cherry"))
