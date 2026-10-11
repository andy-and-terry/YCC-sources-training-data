import std/strutils

let line = "a,b,,c"
echo line.split(',')
echo line.split(',', maxsplit = 1)
echo "  lots   of   space ".splitWhitespace
echo @["x", "y", "z"].join("-")
echo "one\ntwo\nthree".splitLines
echo "a1b22c".split({'1', '2'})
echo "CamelCaseString".normalize
echo "hello".capitalizeAscii, " ", "hello".repeat(2)
echo "abc".startsWith("ab"), " ", "abc".endsWith("bc")
