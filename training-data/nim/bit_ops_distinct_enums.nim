type
  Meters = distinct float
  Perm = enum pRead = 1, pWrite = 2, pExec = 4
  Color = enum Red, Green, Blue

proc `+`(a, b: Meters): Meters {.borrow.}
proc `$`(m: Meters): string = $float(m) & "m"

echo Meters(1.5) + Meters(2.0)
var perms: set[Perm] = {pRead, pExec}
perms.incl pWrite
echo perms, " ", pRead in perms, " ", card(perms)
echo 5 and 3, " ", 5 or 3, " ", 5 xor 3, " ", 1 shl 10, " ", 1024 shr 3, " ", not 5
echo Color.high, " ", ord(Blue), " ", Color(1), " ", succ(Red), " ", $Green
echo high(int8), " ", low(int8), " ", int8(127) + 0, " ", uint8(250) + 5'u8
echo 7 div 2, " ", -7 div 2, " ", 7 mod 3, " ", -7 mod 3, " ", 7 / 2, " ", 2 ^ 10
echo 0b1010, " ", 0xFF, " ", 0o17, " ", 1_000_000, " ", 1e3
for c in Color: echo c
echo {Red..Green}
