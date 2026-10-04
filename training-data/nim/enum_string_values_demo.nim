import std/strutils

type
  Color = enum
    Red = "red"
    Green = "green"
    Blue = "blue"

echo Red, " ", Green, " ", Blue
echo ord(Blue)
echo parseEnum[Color]("green")
echo parseEnum[Color]("purple", Red)

for c in Color:
  echo c, " has ordinal ", ord(c)

echo Color.low, " .. ", Color.high
echo succ(Red)
