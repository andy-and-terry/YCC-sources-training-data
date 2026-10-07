import std/strutils

type
  TokenKind = enum
    tkNumber, tkIdent, tkOp, tkLParen, tkRParen
  Token = object
    kind: TokenKind
    text: string

proc tokenize(src: string): seq[Token] =
  var i = 0
  while i < src.len:
    let c = src[i]
    if c in Whitespace:
      inc i
    elif c in Digits:
      var j = i
      while j < src.len and src[j] in Digits + {'.'}: inc j
      result.add Token(kind: tkNumber, text: src[i ..< j])
      i = j
    elif c in IdentStartChars:
      var j = i
      while j < src.len and src[j] in IdentChars: inc j
      result.add Token(kind: tkIdent, text: src[i ..< j])
      i = j
    elif c == '(':
      result.add Token(kind: tkLParen, text: "("); inc i
    elif c == ')':
      result.add Token(kind: tkRParen, text: ")"); inc i
    else:
      result.add Token(kind: tkOp, text: $c); inc i

for t in tokenize("area = pi * (r + 1.5) ^ 2"):
  echo t.kind, " '", t.text, "'"
