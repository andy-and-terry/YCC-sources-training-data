defmodule Power do
  def pow(_base, 0), do: 1
  def pow(base, exp) when rem(exp, 2) == 0, do: pow(base * base, div(exp, 2))
  def pow(base, exp), do: base * pow(base, exp - 1)
end

IO.inspect(Power.pow(2, 10))
IO.inspect(Power.pow(3, 5))
