type
  Kind = enum kNum, kStr
  Value = object
    case kind: Kind
    of kNum: n: int
    of kStr: s: string

proc show(v: Value): string =
  case v.kind
  of kNum: $v.n
  of kStr: v.s

echo show(Value(kind: kNum, n: 4)), show(Value(kind: kStr, s: "x"))
