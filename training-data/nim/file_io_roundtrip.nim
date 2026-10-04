import std/[os, strutils]

let path = getTempDir() / "nim_roundtrip_demo.txt"

# write
let f = open(path, fmWrite)
for i in 1 .. 3:
  f.writeLine("line ", i)
f.close()

# append
let g = open(path, fmAppend)
g.writeLine("appended")
g.close()

# read whole file, then line by line
echo readFile(path).splitLines().len, " entries"
for line in lines(path):
  echo "> ", line

echo "size: ", getFileSize(path)
removeFile(path)
echo "exists after delete: ", fileExists(path)
