import os, json, strutils

let dir = getTempDir() / "nim_demo"
createDir(dir)
let f = dir / "a.txt"
writeFile(f, "l1\nl2\nl3\n")
echo readFile(f).splitLines().len - 1
for line in lines(f): echo line.toUpperAscii()
let fh = open(f, fmAppend)
fh.writeLine("l4")
fh.close()
echo readLines(f, 4)[3], " ", fileExists(f), " ", getFileSize(f)
echo splitFile(f), " ", f.extractFilename(), " ", changeFileExt(f, "md").endsWith(".md")
let j = parseJson("""{"name": "Ada", "tags": ["a", "b"], "n": {"x": 1.5}}""")
echo j["name"].getStr(), " ", j["tags"].len, " ", j["n"]["x"].getFloat(), " ", j.hasKey("zz")
var o = %*{"id": 7, "list": [1, 2]}
o["extra"] = %true
echo o, " ", pretty(o).len > 0
removeFile(f)
removeDir(dir)
echo dirExists(dir), " ", paramCount(), " ", getEnv("NO_SUCH_VAR_X", "fallback")
