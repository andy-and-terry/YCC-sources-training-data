defmodule Triangle do
  def classify(a, b, c) do
    [x, y, z] = Enum.sort([a, b, c])

    cond do
      x <= 0 or x + y <= z -> :invalid
      a == b and b == c -> :equilateral
      a == b or b == c or a == c -> :isosceles
      true -> :scalene
    end
  end
end

for {a, b, c} <- [{3, 3, 3}, {3, 4, 4}, {3, 4, 5}, {1, 1, 3}], do: IO.inspect(Triangle.classify(a, b, c))
