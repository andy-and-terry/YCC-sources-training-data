defmodule Shoelace do
  def area([first | _] = pts) do
    s =
      pts
      |> Enum.zip(tl(pts) ++ [first])
      |> Enum.map(fn {{x1, y1}, {x2, y2}} -> x1 * y2 - x2 * y1 end)
      |> Enum.sum()

    abs(s) / 2
  end
end

IO.inspect(Shoelace.area([{0, 0}, {4, 0}, {4, 3}, {0, 3}]))
