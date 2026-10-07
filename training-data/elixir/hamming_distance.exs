defmodule Hamming do
  def distance(a, b) when byte_size(a) != byte_size(b), do: {:error, "strands must be of equal length"}

  def distance(a, b) do
    count =
      Enum.zip(String.to_charlist(a), String.to_charlist(b))
      |> Enum.count(fn {x, y} -> x != y end)

    {:ok, count}
  end
end

IO.inspect(Hamming.distance("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
IO.inspect(Hamming.distance("AB", "A"))
