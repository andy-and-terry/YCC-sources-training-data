import std/os

let p = "/usr/local/lib/libfoo.so.1"
echo p.splitPath
echo p.extractFilename
echo p.parentDir
echo splitFile(p)
echo "a" / "b" / "c.txt"
echo changeFileExt("main.nim", "js")
echo p.isAbsolute
echo "x/./y/../z".normalizedPath
echo getTempDir().len > 0
