import Foundation

let q = DispatchQueue(label: "work", attributes: .concurrent)
let group = DispatchGroup()
let lock = NSLock()
var total = 0
for i in 1...5 {
    group.enter()
    q.async { lock.lock(); total += i; lock.unlock(); group.leave() }
}
group.wait()
print(total)
let serial = DispatchQueue(label: "serial")
var order: [Int] = []
for i in 1...3 { serial.async { order.append(i) } }
serial.sync {}
print(order)
let sem = DispatchSemaphore(value: 0)
DispatchQueue.global().async { sem.signal() }
sem.wait()
print("done")
