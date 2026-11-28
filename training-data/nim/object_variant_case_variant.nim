type
  Kind = enum kNum, kAdd
  Expr = ref object
    case kind: Kind
    of kNum: n: int
    of kAdd: l, r: Expr

proc eval(e: Expr): int =
  case e.kind
  of kNum: e.n
  of kAdd: eval(e.l) + eval(e.r)

echo eval(Expr(kind: kAdd, l: Expr(kind: kNum, n: 2), r: Expr(kind: kNum, n: 5)))
