func isIsogram(_ word: String) -> Bool {
    let letters = word.lowercased().filter(\.isLetter)
    return Set(letters).count == letters.count
}

for w in ["lumberjacks", "background", "six-year-old", "isograms"] { print(w, isIsogram(w)) }
