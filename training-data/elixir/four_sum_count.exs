defmodule FourSum do
  def count(a, b, c, d) do
    sums = Enum.frequencies(for x <- a, y <- b, do: x + y)
    Enum.sum(for x <- c, y <- d, do: Map.get(sums, -(x + y), 0))
  end
end

IO.puts(FourSum.count([1, 2], [-2, -1], [-1, 2], [0, 2])) # 2
