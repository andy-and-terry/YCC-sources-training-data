defmodule Zigzag do
  def convert(s, rows) when rows == 1 or rows >= byte_size(s), do: s

  def convert(s, rows) do
    cycle = Enum.to_list(0..(rows - 1)) ++ Enum.to_list((rows - 2)..1//-1)

    s
    |> String.graphemes()
    |> Enum.zip(Stream.cycle(cycle))
    |> Enum.sort_by(fn {_c, r} -> r end)
    |> Enum.map_join(fn {c, _r} -> c end)
  end
end

IO.puts(Zigzag.convert("PAYPALISHIRING", 3))
