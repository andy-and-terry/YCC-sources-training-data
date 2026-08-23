defmodule GcdLcm do
  def gcd(a, 0), do: abs(a)
  def gcd(a, b), do: gcd(b, rem(a, b))

  def lcm(a, b), do: div(abs(a * b), gcd(a, b))
end

IO.inspect(GcdLcm.gcd(48, 18))
IO.inspect(GcdLcm.lcm(4, 6))
