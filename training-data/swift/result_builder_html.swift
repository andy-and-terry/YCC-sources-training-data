@resultBuilder
struct StringBuilder {
    static func buildBlock(_ parts: String...) -> String { parts.joined(separator: "\n") }
}

@StringBuilder func page() -> String {
    "<h1>Title</h1>"
    "<p>Body</p>"
}

print(page())
