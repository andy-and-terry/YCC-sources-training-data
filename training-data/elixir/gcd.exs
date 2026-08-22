defmodule Gcd do
  def compute(a, 0), do: a
  def compute(a, b), do: compute(b, rem(a, b))
end

IO.puts(Gcd.compute(48, 18))
IO.puts(Gcd.compute(100, 75))
