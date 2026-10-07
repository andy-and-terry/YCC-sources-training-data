import Bitwise

defmodule Bits do
  def popcount(0), do: 0
  def popcount(n), do: (n &&& 1) + popcount(n >>> 1)
end

n = 0b10110100

IO.inspect(Bits.popcount(n))
IO.inspect(n &&& 0xF)
IO.inspect(n ||| 1)
IO.inspect(bxor(n, 0xFF))
IO.inspect(bnot(5))
IO.inspect(1 <<< 5)
IO.inspect(n >>> 2)
IO.inspect(Integer.to_string(n, 2))
IO.inspect(Integer.digits(n, 2) |> Enum.sum())
IO.inspect((n &&& n - 1) == 0)
IO.inspect(n &&& -n)
