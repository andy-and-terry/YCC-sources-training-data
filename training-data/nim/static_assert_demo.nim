const size = 8
static:
  assert size mod 2 == 0
  echo "checked at compile time"

type Buffer = array[size, byte]
static: assert sizeof(Buffer) == 8

proc half(n: static int): int = n div 2
echo half(size)
echo half(10)
