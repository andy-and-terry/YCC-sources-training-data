defmodule Circle do
  @moduledoc "Circle helpers using module attributes."

  @pi 3.14159
  @unit_radius 1
  @shapes [:circle, :ring]

  @doc "Area for radius r."
  def area(r), do: @pi * r * r

  def unit_area, do: area(@unit_radius)

  def shapes, do: @shapes
end

defmodule Registry2 do
  Module.register_attribute(__MODULE__, :handlers, accumulate: true)

  @handlers :alpha
  @handlers :beta
  @handlers :gamma

  def handlers, do: Enum.reverse(@handlers)
end

IO.inspect(Circle.area(2))
IO.inspect(Circle.unit_area())
IO.inspect(Circle.shapes())
IO.inspect(Registry2.handlers())
IO.inspect(Circle.__info__(:functions))
