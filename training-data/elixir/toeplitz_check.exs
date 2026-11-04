defmodule Toeplitz do
  def toeplitz?(rows) do
    rows
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.all?(fn [prev, cur] -> tl(cur) == Enum.take(prev, length(cur) - 1) end)
  end
end

IO.inspect(Toeplitz.toeplitz?([[1, 2, 3], [4, 1, 2], [5, 4, 1]]))
IO.inspect(Toeplitz.toeplitz?([[1, 2], [2, 2]]))
