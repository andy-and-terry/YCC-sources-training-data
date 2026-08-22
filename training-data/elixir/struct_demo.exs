defmodule Point do
  defstruct x: 0, y: 0

  def add(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}) do
    %Point{x: x1 + x2, y: y1 + y2}
  end
end

p1 = %Point{x: 1, y: 2}
p2 = %Point{x: 3, y: 4}
IO.inspect(Point.add(p1, p2))
