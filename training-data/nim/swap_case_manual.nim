import std/unicode

proc swapCase(s: string): string =
  for r in s.runes:
    result.add(if r.isUpper: r.toLower.toUTF8 else: r.toUpper.toUTF8)

echo swapCase("Hello World 42")
