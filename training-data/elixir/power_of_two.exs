defmodule PowerOfTwo do
  def power_of_two?(n) when n <= 0, do: false
  def power_of_two?(n), do: Bitwise.band(n, n - 1) == 0
end

IO.inspect(PowerOfTwo.power_of_two?(16))
IO.inspect(PowerOfTwo.power_of_two?(18))
