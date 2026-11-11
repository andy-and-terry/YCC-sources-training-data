# Population count (number of set bits) for 0..15
import Bitwise

bits = fn n -> n |> Integer.digits(2) |> Enum.sum() end

IO.puts(Enum.map_join(0..15, " ", bits))
