import std/options

proc findUser(id: int): Option[string] =
  if id == 1: some("Alice")
  else: none(string)

let user = findUser(1)
if user.isSome:
  echo "found: ", user.get
else:
  echo "not found"

let missing = findUser(2)
echo missing.get("unknown")

echo user
echo missing
