import options, strutils

proc parse(s: string): Option[int] =
  try: some(parseInt(s))
  except ValueError: none(int)

echo parse("42")
echo parse("zz").isNone
try:
  raise newException(ValueError, "custom")
except ValueError as e:
  echo "caught ", e.msg
finally:
  echo "finally"
