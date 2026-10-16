import std/strutils

type SomeEnum = enum a, b, c

echo parseHexInt("ff")
echo parseHexInt("0x1A")
echo parseBinInt("1011")
echo parseOctInt("17")
echo parseInt("-42")
echo parseFloat("2.5e3")
echo parseBool("true")
echo parseEnum[SomeEnum]("b")
