@resultBuilder
struct ListBuilder {
    static func buildBlock(_ parts: [String]...) -> [String] { parts.flatMap { $0 } }
    static func buildExpression(_ s: String) -> [String] { [s] }
    static func buildOptional(_ p: [String]?) -> [String] { p ?? [] }
    static func buildEither(first: [String]) -> [String] { first }
    static func buildEither(second: [String]) -> [String] { second }
}

func items(@ListBuilder _ f: () -> [String]) -> [String] { f() }
let flag = true
print(items { "a"; "b"; if flag { "c" }; if !flag { "d" } else { "e" } })
