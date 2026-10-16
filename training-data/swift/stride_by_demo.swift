for i in stride(from: 0, to: 10, by: 3) {
    print("to:", i)
}

for i in stride(from: 10, through: 0, by: -5) {
    print("through:", i)
}

let evens = stride(from: 2, through: 20, by: 2).map { $0 }
print(evens)

let quarters = Array(stride(from: 0.0, through: 1.0, by: 0.25))
print(quarters)
