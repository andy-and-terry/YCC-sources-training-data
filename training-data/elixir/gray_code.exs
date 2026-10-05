defmodule GrayCode do
  import Bitwise

  def to_gray(n), do: bxor(n, n >>> 1)

  def from_gray(g), do: from_gray(g, 0)

  defp from_gray(0, acc), do: acc
  defp from_gray(g, acc), do: from_gray(g >>> 1, bxor(acc, g))
end

for i <- 0..7 do
  g = GrayCode.to_gray(i)
  bits = g |> Integer.to_string(2) |> String.pad_leading(3, "0")
  IO.puts("#{i} -> #{bits} -> #{GrayCode.from_gray(g)}")
end
