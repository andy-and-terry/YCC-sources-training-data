func isRotation(_ a: String, _ b: String) -> Bool {
    a.count == b.count && (a + a).contains(b)
}

print(isRotation("waterbottle", "erbottlewat"))
print(isRotation("abc", "acb"))
