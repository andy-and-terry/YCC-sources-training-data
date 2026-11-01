defmodule Shape do
  def area({:circle, r}), do: 3.14159 * r * r
  def area({:rect, w, h}), do: w * h
  def area(%{side: s}), do: s * s
end

IO.inspect(Shape.area({:circle, 1}))
IO.inspect(Shape.area({:rect, 2, 3}))
IO.inspect(Shape.area(%{side: 4}))
