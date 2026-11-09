defmodule Shape do
  def area({:circle, r}), do: 3.14159 * r * r
  def area({:rect, w, h}), do: w * h
end

IO.puts(Shape.area({:rect, 3, 4}))
