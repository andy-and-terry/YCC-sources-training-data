defmodule Stern do
  def sequence(count) do
    table =
      Enum.reduce(2..(count - 1), %{0 => 0, 1 => 1}, fn n, acc ->
        half = div(n, 2)
        value = if rem(n, 2) == 0, do: acc[half], else: acc[half] + acc[half + 1]
        Map.put(acc, n, value)
      end)

    Enum.map(0..(count - 1), &Map.fetch!(table, &1))
  end
end

IO.puts(Enum.join(Stern.sequence(20), " "))
