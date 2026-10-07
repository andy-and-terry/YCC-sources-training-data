defmodule ExtendedEuclidean do
  def extended_gcd(a, 0), do: {a, 1, 0}

  def extended_gcd(a, b) do
    {g, x1, y1} = extended_gcd(b, rem(a, b))
    {g, y1, x1 - div(a, b) * y1}
  end
end

{g, x, y} = ExtendedEuclidean.extended_gcd(35, 15)
IO.puts("gcd=#{g} x=#{x} y=#{y}")
