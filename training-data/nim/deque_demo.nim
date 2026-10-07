import std/deques

var d = initDeque[int]()
d.addLast(1)
d.addLast(2)
d.addFirst(0)
echo d
echo d.popFirst()
echo d.popLast()
echo d.len
