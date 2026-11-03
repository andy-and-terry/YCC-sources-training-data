func swapCase(_ s: String) -> String {
    String(s.map { $0.isUppercase ? Character($0.lowercased()) : Character($0.uppercased()) })
}

print(swapCase("Hello World 42"))
