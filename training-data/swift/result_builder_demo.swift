@resultBuilder
struct HTMLBuilder {
    static func buildBlock(_ parts: String...) -> String {
        parts.joined()
    }

    static func buildEither(first component: String) -> String {
        component
    }

    static func buildEither(second component: String) -> String {
        component
    }

    static func buildArray(_ components: [String]) -> String {
        components.joined()
    }
}

func html(@HTMLBuilder _ content: () -> String) -> String {
    "<html>\(content())</html>"
}

func paragraph(_ text: String) -> String {
    "<p>\(text)</p>"
}

let includeFooter = true

let page = html {
    paragraph("Welcome")
    if includeFooter {
        paragraph("Footer")
    } else {
        paragraph("No footer")
    }
    for item in ["a", "b"] {
        paragraph(item)
    }
}

print(page)
