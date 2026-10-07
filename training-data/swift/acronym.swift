func abbreviate(_ phrase: String) -> String {
    phrase
        .split { !$0.isLetter && $0 != "'" }
        .compactMap { $0.first?.uppercased() }
        .joined()
}

print(abbreviate("Portable Network Graphics"))
print(abbreviate("Complementary metal-oxide semiconductor"))
