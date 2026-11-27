defmodule Gould do
  import Bitwise

  def popcount(0), do: 0
  def popcount(n), do: (n &&& 1) + popcount(n >>> 1)

  def gould(n), do: 1 <<< popcount(n)
end

0..15 |> Enum.map(&Gould.gould/1) |> IO.inspect()
