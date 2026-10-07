import Foundation

let group = DispatchGroup()
let queue = DispatchQueue(label: "results", attributes: .concurrent)
let lock = NSLock()
var results: [Int] = []

for n in 1...5 {
    group.enter()
    queue.async {
        let square = n * n
        lock.lock()
        results.append(square)
        lock.unlock()
        group.leave()
    }
}

group.wait()
print(results.sorted())
