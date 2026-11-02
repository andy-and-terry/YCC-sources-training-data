type
  Kind = enum kNum, kStr
  Value = object
    case kind: Kind
    of kNum: n: int
    of kStr: s: string

let vs = @[Value(kind: kNum, n: 3), Value(kind: kStr, s: "hi")]
for v in vs:
  case v.kind
  of kNum: echo v.n
  of kStr: echo v.s
