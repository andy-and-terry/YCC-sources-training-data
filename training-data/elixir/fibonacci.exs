defmodule Fibonacci do
  def sequence(n) do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
    |> Enum.take(n)
  end
end

IO.inspect(Fibonacci.sequence(11))
