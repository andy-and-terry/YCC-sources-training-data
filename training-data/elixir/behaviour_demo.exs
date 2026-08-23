defmodule Shape do
  @callback area(term()) :: number()
  @callback perimeter(term()) :: number()
end

defmodule Rectangle do
  @behaviour Shape

  defstruct width: 0, height: 0

  @impl true
  def area(%Rectangle{width: w, height: h}), do: w * h

  @impl true
  def perimeter(%Rectangle{width: w, height: h}), do: 2 * (w + h)
end

rect = %Rectangle{width: 4, height: 5}
IO.inspect(Rectangle.area(rect))
IO.inspect(Rectangle.perimeter(rect))
