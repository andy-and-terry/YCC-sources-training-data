defmodule Stern do
  def sequence(count) do
    Enum.reduce(2..(count - 1), %{0 => 0, 1 => 1}, fn i, acc ->
      h = div(i, 2)
      v = if rem(i, 2) == 0, do: acc[h], else: acc[h] + acc[h + 1]
      Map.put(acc, i, v)
    end)
    |> Enum.sort()
    |> Enum.map(&elem(&1, 1))
  end
end

IO.inspect(Stern.sequence(15)) # [0, 1, 1, 2, 1, 3, 2, 3, 1, 4, 3, 5, 2, 5, 3]
