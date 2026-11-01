@resultBuilder
struct ListBuilder {
    static func buildBlock(_ parts: String...) -> [String] { parts }
}

func items(@ListBuilder _ content: () -> [String]) -> [String] { content() }

print(items {
    "one"
    "two"
    "three"
})
