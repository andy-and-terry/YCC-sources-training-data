defmodule Factorial do
  def compute(0), do: 1
  def compute(n) when n > 0, do: n * compute(n - 1)

  def tail_compute(n), do: tail_compute(n, 1)
  defp tail_compute(0, acc), do: acc
  defp tail_compute(n, acc), do: tail_compute(n - 1, acc * n)
end

IO.inspect(Factorial.compute(10))
IO.inspect(Factorial.tail_compute(10))
