defmodule Point do
  @enforce_keys [:x, :y]
  defstruct [:x, :y]

  @type t :: %__MODULE__{x: number(), y: number()}

  @spec distance(t(), t()) :: float()
  def distance(%Point{x: x1, y: y1}, %Point{x: x2, y: y2}) do
    :math.sqrt(:math.pow(x2 - x1, 2) + :math.pow(y2 - y1, 2))
  end
end

p1 = %Point{x: 0, y: 0}
p2 = %Point{x: 3, y: 4}
IO.inspect(Point.distance(p1, p2))
