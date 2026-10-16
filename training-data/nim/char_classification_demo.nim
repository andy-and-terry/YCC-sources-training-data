import std/strutils

for c in "aZ5 _!":
  echo '\'', c, "' alpha=", c.isAlphaAscii, " digit=", c.isDigit,
       " space=", c.isSpaceAscii, " upper=", c.isUpperAscii
echo ord('A'), " ", chr(97)
echo 'a'.toUpperAscii, 'Q'.toLowerAscii
echo {'a'..'e'}
echo 'c' in {'a'..'e'}
