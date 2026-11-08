func rot47(_ s: String) -> String {
    String(s.unicodeScalars.map { u -> Character in
        let n = Int(u.value)
        return (33...126).contains(n) ? Character(UnicodeScalar(33 + (n - 33 + 47) % 94)!) : Character(u)
    })
}

let e = rot47("Hello, World!")
print(e, rot47(e))
