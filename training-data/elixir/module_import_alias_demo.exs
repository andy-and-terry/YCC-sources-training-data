defmodule Geometry.Shapes do
  def area({:square, s}), do: s * s
  def area({:rect, w, h}), do: w * h
end

defmodule Demo do
  alias Geometry.Shapes, as: S
  import Enum, only: [map: 2, sum: 1]
  require Integer

  def run do
    shapes = [{:square, 2}, {:rect, 2, 3}]
    areas = map(shapes, &S.area/1)
    IO.inspect(areas)
    IO.inspect(sum(areas))
    IO.inspect(Integer.is_odd(sum(areas)))
  end
end

Demo.run()
