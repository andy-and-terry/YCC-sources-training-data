defmodule Shoelace do
  def area(pts) do
    next = tl(pts) ++ [hd(pts)]

    pts
    |> Enum.zip(next)
    |> Enum.map(fn {{x1, y1}, {x2, y2}} -> x1 * y2 - x2 * y1 end)
    |> Enum.sum()
    |> abs()
    |> Kernel./(2)
  end
end

IO.puts(Shoelace.area([{0, 0}, {4, 0}, {4, 3}, {0, 3}]))
