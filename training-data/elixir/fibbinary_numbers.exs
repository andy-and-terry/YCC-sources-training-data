# Fibbinary numbers: no two adjacent 1 bits.
import Bitwise

0..49
|> Enum.filter(fn n -> (n &&& (n >>> 1)) == 0 end)
|> Enum.join(" ")
|> IO.puts()
