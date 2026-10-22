defmodule Delannoy do
  def central(size) do
    Stream.iterate(List.duplicate(1, size), &next_row/1)
    |> Enum.take(size)
    |> Enum.with_index()
    |> Enum.map(fn {row, i} -> Enum.at(row, i) end)
  end

  defp next_row(prev) do
    steps = Enum.zip(prev, tl(prev))
    [1 | Enum.scan(steps, 1, fn {p0, p1}, cur -> p1 + cur + p0 end)]
  end
end

IO.puts(Enum.join(Delannoy.central(10), " "))
