defmodule Shape do
  def area({:circle, radius}), do: :math.pi() * radius * radius
  def area({:rectangle, width, height}), do: width * height
  def area({:triangle, base, height}), do: 0.5 * base * height
end

shapes = [{:circle, 2}, {:rectangle, 3, 4}, {:triangle, 6, 2}]
Enum.each(shapes, fn shape -> IO.inspect(Shape.area(shape)) end)
