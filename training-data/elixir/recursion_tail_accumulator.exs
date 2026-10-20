defmodule Rec do
  def sum([], acc), do: acc
  def sum([h | t], acc), do: sum(t, acc + h)

  def fact(0), do: 1
  def fact(n) when n > 0, do: n * fact(n - 1)

  def fib(n), do: fib(n, 0, 1)
  defp fib(0, a, _), do: a
  defp fib(n, a, b), do: fib(n - 1, b, a + b)

  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])
end

IO.inspect({Rec.sum([1, 2, 3, 4], 0), Rec.fact(20), Rec.fib(90), Rec.reverse([1, 2, 3])})
