defmodule Shape do
  def area({:circle, r}), do: 3.14159 * r * r
  def area({:rect, w, h}), do: w * h
  def area({:square, s}), do: area({:rect, s, s})
end

IO.puts(Shape.area({:circle, 1}))
IO.puts(Shape.area({:rect, 2, 3}))
IO.puts(Shape.area({:square, 4}))
