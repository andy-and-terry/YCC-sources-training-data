import options, strutils

proc parse(s: string): Option[int] =
  try: some(parseInt(s))
  except ValueError: none(int)

for s in ["12", "x"]:
  let r = parse(s)
  if r.isSome: echo "got ", r.get
  else: echo "invalid ", s
