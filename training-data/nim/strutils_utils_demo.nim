import std/strutils

let s = "  Hello, World  "
echo s.strip()
echo s.toUpperAscii()
echo "a,b,,c".split(',')
echo @["x", "y", "z"].join("-")
echo "banana".count('a')
echo "banana".replace("an", "AN")
echo "42".parseInt() + 1
echo "hello".startsWith("he"), " ", "hello".endsWith("lo")
echo repeat("ab", 3)
echo "3.5".parseFloat()
