defmodule Ugly do
  def nth(n), do: build([1], 0, 0, 0, n) |> Enum.reverse() |> Enum.at(n - 1)

  defp build(acc, _, _, _, n) when length(acc) >= n, do: acc

  defp build(acc, i2, i3, i5, n) do
    seq = Enum.reverse(acc)
    c2 = Enum.at(seq, i2) * 2
    c3 = Enum.at(seq, i3) * 3
    c5 = Enum.at(seq, i5) * 5
    next = Enum.min([c2, c3, c5])

    build(
      [next | acc],
      if(next == c2, do: i2 + 1, else: i2),
      if(next == c3, do: i3 + 1, else: i3),
      if(next == c5, do: i5 + 1, else: i5),
      n
    )
  end
end

IO.inspect(Enum.map(1..12, &Ugly.nth/1))
