func memoize<In: Hashable, Out>(_ f: @escaping (In) -> Out) -> (In) -> Out {
    var cache: [In: Out] = [:]
    return { input in
        if let hit = cache[input] { return hit }
        let result = f(input)
        cache[input] = result
        return result
    }
}

var calls = 0
let square = memoize { (n: Int) -> Int in
    calls += 1
    return n * n
}

print(square(4), square(4), square(5))
print("computed \(calls) times")
