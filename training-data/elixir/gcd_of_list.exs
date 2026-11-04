defmodule GcdAll do
  def gcd(a, 0), do: abs(a)
  def gcd(a, b), do: gcd(b, rem(a, b))

  def gcd_all(nums), do: Enum.reduce(nums, 0, &gcd(&2, &1))
end

IO.puts(GcdAll.gcd_all([12, 18, 24]))
IO.puts(GcdAll.gcd_all([7, 13]))
