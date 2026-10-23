import strutils

proc hexDump(s: string) =
  for off in countup(0, s.high, 8):
    let chunk = s[off ..< min(off + 8, s.len)]
    var hex = ""
    var asc = ""
    for c in chunk:
      hex.add toHex(ord(c), 2) & " "
      asc.add(if c in PrintableChars - Newlines: c else: '.')
    echo toHex(off, 4), "  ", hex.alignLeft(24), asc

hexDump("Hello, Nim!\n\x00\x01end")
