final class SkipListNode {
    var value: Int
    var forward: [SkipListNode?]

    init(_ value: Int, level: Int) {
        self.value = value
        self.forward = [SkipListNode?](repeating: nil, count: level + 1)
    }
}

final class SkipList {
    private let maxLevel = 4
    private var level = 0
    private let head = SkipListNode(Int.min, level: 4)

    private func randomLevel() -> Int {
        var lvl = 0
        while Double.random(in: 0..<1) < 0.5 && lvl < maxLevel {
            lvl += 1
        }
        return lvl
    }

    func insert(_ value: Int) {
        var update = [SkipListNode?](repeating: nil, count: maxLevel + 1)
        var current = head

        for i in stride(from: level, through: 0, by: -1) {
            while let next = current.forward[i], next.value < value {
                current = next
            }
            update[i] = current
        }

        let newLevel = randomLevel()
        if newLevel > level {
            for i in (level + 1)...newLevel {
                update[i] = head
            }
            level = newLevel
        }

        let newNode = SkipListNode(value, level: newLevel)
        for i in 0...newLevel {
            newNode.forward[i] = update[i]?.forward[i]
            update[i]?.forward[i] = newNode
        }
    }

    func contains(_ value: Int) -> Bool {
        var current = head
        for i in stride(from: level, through: 0, by: -1) {
            while let next = current.forward[i], next.value < value {
                current = next
            }
        }
        return current.forward[0]?.value == value
    }
}

let list = SkipList()
[3, 6, 7, 9, 12, 19, 17].forEach { list.insert($0) }
print(list.contains(19))
print(list.contains(15))
