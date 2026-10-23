let numbers: [Int32] = [3, 1, 4, 1, 5, 9, 2, 6]

// Read-only access to contiguous storage.
let total = numbers.withUnsafeBufferPointer { buffer -> Int32 in
    var sum: Int32 = 0
    for i in 0..<buffer.count { sum += buffer[i] }
    return sum
}
print("sum:", total)

// Mutable access to modify in place.
var values = numbers
values.withUnsafeMutableBufferPointer { buffer in
    buffer.sort()
    for i in buffer.indices { buffer[i] *= 10 }
}
print("sorted x10:", values)

// Manual allocation must be paired with deallocate.
let capacity = 5
let raw = UnsafeMutablePointer<Int>.allocate(capacity: capacity)
raw.initialize(repeating: 0, count: capacity)
for i in 0..<capacity { raw[i] = i * i }
print("squares:", (0..<capacity).map { raw[$0] })
raw.deallocate()

print("size of Int32:", MemoryLayout<Int32>.size)
print("stride of Int:", MemoryLayout<Int>.stride)
