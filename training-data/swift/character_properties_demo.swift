let sample = "Hello, World 42!"

var letters = 0, digits = 0, spaces = 0, punct = 0, upper = 0
for ch in sample {
    if ch.isLetter { letters += 1 }
    if ch.isNumber { digits += 1 }
    if ch.isWhitespace { spaces += 1 }
    if ch.isPunctuation { punct += 1 }
    if ch.isUppercase { upper += 1 }
}
print(letters, digits, spaces, punct, upper)
print(Character("a").asciiValue as Any)
print(Character("7").wholeNumberValue as Any)
print("é".unicodeScalars.count, "👨‍👩‍👧".count)
