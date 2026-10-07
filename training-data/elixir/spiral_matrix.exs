defmodule Spiral do
  # Peel the first row, then spiral the counter-clockwise-rotated remainder.
  def build(n), do: build(1, n, n)

  defp build(_start, 0, _cols), do: []
  defp build(_start, _rows, 0), do: []

  defp build(start, rows, cols) do
    first = Enum.to_list(start..(start + cols - 1))
    rest = build(start + cols, cols, rows - 1) |> rotate_clockwise()
    [first | rest]
  end

  defp rotate_clockwise([]), do: []
  defp rotate_clockwise(m), do: m |> Enum.zip() |> Enum.map(&(&1 |> Tuple.to_list() |> Enum.reverse()))
end

Spiral.build(4) |> Enum.each(&IO.puts(Enum.join(&1, "\t")))
