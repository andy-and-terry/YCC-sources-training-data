template unless(cond: bool, body: untyped) =
  if not cond: body

unless 1 > 2:
  echo "ran"
