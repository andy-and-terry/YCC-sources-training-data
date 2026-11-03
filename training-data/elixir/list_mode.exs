defmodule ListMode do
  def modes(items) do
    counts = Enum.frequencies(items)
    top = counts |> Map.values() |> Enum.max()
    counts |> Enum.filter(fn {_, c} -> c == top end) |> Enum.map(&elem(&1, 0)) |> Enum.sort()
  end
end

IO.inspect(ListMode.modes([1, 2, 2, 3, 3, 4]))
