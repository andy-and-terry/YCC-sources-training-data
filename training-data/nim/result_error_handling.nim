import std/strutils

type
  ParseResult[T] = object
    ok: bool
    value: T
    error: string

proc success[T](v: T): ParseResult[T] = ParseResult[T](ok: true, value: v)
proc failure[T](msg: string): ParseResult[T] = ParseResult[T](ok: false, error: msg)

proc parsePositive(s: string): ParseResult[int] =
  try:
    let n = parseInt(s)
    if n <= 0: return failure[int]("not positive: " & s)
    success(n)
  except ValueError:
    failure[int]("not a number: " & s)

for s in ["42", "-3", "abc", "7"]:
  let r = parsePositive(s)
  if r.ok: echo "ok ", r.value
  else: echo "error: ", r.error
