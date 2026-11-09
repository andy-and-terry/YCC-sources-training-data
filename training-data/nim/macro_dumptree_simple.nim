import std/macros

macro unrollEcho(n: static int, s: string): untyped =
  result = newStmtList()
  for _ in 1..n:
    result.add quote do: echo `s`

unrollEcho(3, "hello")
