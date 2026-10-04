import Bitwise

a = 0b1100
b = 0b1010

IO.inspect(a &&& b, base: :binary)
IO.inspect(a ||| b, base: :binary)
IO.inspect(bxor(a, b), base: :binary)
IO.inspect(bnot(a))
IO.inspect(a <<< 2)
IO.inspect(a >>> 2)

defmodule Bits do
  import Bitwise

  def set(n, i), do: n ||| 1 <<< i
  def clear(n, i), do: n &&& bnot(1 <<< i)
  def set?(n, i), do: (n >>> i &&& 1) == 1

  def popcount(0), do: 0
  def popcount(n), do: (n &&& 1) + popcount(n >>> 1)
end

IO.inspect(Bits.set(0, 3))
IO.inspect(Bits.clear(15, 0))
IO.inspect(Bits.set?(8, 3))
IO.inspect(Bits.popcount(255))
