import std/pegs

# PEGs are a pure-Nim alternative to regular expressions.
let datePeg = peg"{\d\d\d\d} '-' {\d\d} '-' {\d\d}"

var matches: array[3, string]
if "2024-03-15" =~ datePeg:
  echo "year=", matches[0], " month=", matches[1], " day=", matches[2]

let text = "cat bat rat sat"
echo text.replace(peg"'at'", "og")
echo text.findAll(peg"\w+")
echo "x1y22z333".findAll(peg"\d+")
