import std/strutils
import std/parseopt

# Parse a fixed command line so the demo is deterministic.
var p = initOptParser("--name=Ada -v --count 3 input.txt output.txt")
var verbose = false
var name = ""
var count = 1
var files: seq[string]

for kind, key, val in p.getopt():
  case kind
  of cmdArgument:
    files.add key
  of cmdLongOption, cmdShortOption:
    case key
    of "name": name = val
    of "v", "verbose": verbose = true
    of "count": count = parseInt(val)
    else: echo "unknown option: ", key
  of cmdEnd: discard

echo "name=", name, " verbose=", verbose
echo "files=", files
