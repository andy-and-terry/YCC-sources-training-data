# Shoelace polygon area.
defmodule Polygon do
  def area(pts) do
    next = tl(pts) ++ [hd(pts)]
    s = Enum.zip(pts, next) |> Enum.map(fn {{x1, y1}, {x2, y2}} -> x1 * y2 - x2 * y1 end) |> Enum.sum()
    abs(s) / 2
  end
end

IO.inspect(Polygon.area([{0, 0}, {4, 0}, {4, 3}, {0, 3}]))
