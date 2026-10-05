defmodule MatrixFib do
  def fib(n), do: loop(n, {1, 0, 0, 1}, {1, 1, 1, 0})

  defp loop(0, {_a, b, _c, _d}, _base), do: b

  defp loop(n, result, base) do
    result = if rem(n, 2) == 1, do: mul(result, base), else: result
    loop(div(n, 2), result, mul(base, base))
  end

  defp mul({a, b, c, d}, {e, f, g, h}) do
    {a * e + b * g, a * f + b * h, c * e + d * g, c * f + d * h}
  end
end

for n <- [1, 10, 50, 90, 200] do
  IO.puts("fib(#{n}) = #{MatrixFib.fib(n)}")
end
