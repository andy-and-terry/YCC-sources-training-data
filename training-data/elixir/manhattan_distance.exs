defmodule Dist do
  def manhattan(a, b), do: Enum.zip(a, b) |> Enum.map(fn {x, y} -> abs(x - y) end) |> Enum.sum()
end

IO.puts(Dist.manhattan([1, 2], [4, 6]))
