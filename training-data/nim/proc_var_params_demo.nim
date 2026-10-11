proc swap2(a, b: var int) =
  let t = a
  a = b
  b = t

proc divmod2(a, b: int; q, r: var int) =
  q = a div b
  r = a mod b

var x = 1
var y = 2
swap2(x, y)
echo x, " ", y
var q, r: int
divmod2(17, 5, q, r)
echo q, " ", r
