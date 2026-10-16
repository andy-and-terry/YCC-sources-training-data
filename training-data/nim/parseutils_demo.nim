import std/parseutils

var n: int
let consumed = parseInt("123abc", n)
echo consumed, " ", n

var word: string
let k = parseWhile("hello123", word, {'a'..'z'})
echo k, " ", word

var tok: string
discard parseUntil("key=value", tok, '=')
echo tok

var f: float
discard parseFloat("3.25rest", f)
echo f
