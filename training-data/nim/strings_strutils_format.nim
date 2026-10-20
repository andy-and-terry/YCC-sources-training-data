import strutils, strformat, sequtils

let s = "Hello, World"
echo s.toUpperAscii(), " ", s.len, " ", s[0..4], " ", s[^5..^1], " ", s.find("World")
echo s.replace("l", "L"), " ", s.split(", "), " ", s.contains("lo"), " ", s.startsWith("He")
echo "  pad ".strip(), "|", "x".repeat(3), "|", "7".align(3, '0'), "|", "ab".alignLeft(4, '.')
echo s.toLowerAscii().count('o'), " ", s.reversed(), " ", s.capitalizeAscii()
let n = 42
let pi = 3.14159
echo fmt"{n} {n*2} {pi:.2f} {n:05} {s.len:>4} {n:#x}"
echo &"{s}!"
echo "a,b;c".split({',', ';'}), " ", "1 2 3".splitWhitespace().map(parseInt), " ", parseFloat("2.5") + 1.0
echo "x=1".partition("="), " ", $n & "!", " ", join(@["a", "b"], "-"), " ", "abc".isAlphaAscii()
echo %"$1 is $2" % ["Ada", "36"]
echo "line1\nline2".splitLines().len, " ", "tab\there", " ", r"raw\n"
echo char(65), " ", ord('a'), " ", 'a'.isUpperAscii(), " ", "ß".len
