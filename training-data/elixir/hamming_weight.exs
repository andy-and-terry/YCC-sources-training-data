defmodule Bits do
  import Bitwise

  def popcount(0), do: 0
  def popcount(n), do: 1 + popcount(n &&& n - 1)
end

IO.puts(Bits.popcount(0b10110111))
IO.puts(for(<<1::1 <- :binary.encode_unsigned(0b10110111)>>, do: 1) |> length())
