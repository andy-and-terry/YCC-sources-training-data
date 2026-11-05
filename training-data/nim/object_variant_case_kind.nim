type
  Kind = enum kNum, kStr
  Value = object
    case kind: Kind
    of kNum: n: int
    of kStr: s: string

proc show(v: Value): string =
  case v.kind
  of kNum: "num " & $v.n
  of kStr: "str " & v.s

echo show(Value(kind: kNum, n: 5))
echo show(Value(kind: kStr, s: "hi"))
