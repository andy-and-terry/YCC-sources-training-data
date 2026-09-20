defmodule ExtendedEuclid do
  def compute(a, 0), do: {a, 1, 0}

  def compute(a, b) do
    {gcd, x1, y1} = compute(b, rem(a, b))
    {gcd, y1, x1 - div(a, b) * y1}
  end
end

{gcd, x, y} = ExtendedEuclid.compute(240, 46)
IO.inspect({gcd, x, y})
IO.inspect(240 * x + 46 * y)
