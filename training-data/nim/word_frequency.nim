import tables, strutils

proc wordFrequency(text: string): Table[string, int] =
  result = initTable[string, int]()
  for word in text.toLowerAscii.splitWhitespace:
    result[word] = result.getOrDefault(word, 0) + 1

echo wordFrequency("the quick brown fox the lazy fox")
