defmodule EulerTotient do
  def phi(n) do
    {result, remaining} = factor_reduce(n, 2, n)
    if remaining > 1, do: result - div(result, remaining), else: result
  end

  defp factor_reduce(result, p, n) when p * p > n, do: {result, n}

  defp factor_reduce(result, p, n) do
    if rem(n, p) == 0 do
      n = strip_factor(n, p)
      factor_reduce(result - div(result, p), p + 1, n)
    else
      factor_reduce(result, p + 1, n)
    end
  end

  defp strip_factor(n, p) when rem(n, p) == 0, do: strip_factor(div(n, p), p)
  defp strip_factor(n, _p), do: n
end

Enum.each([1, 9, 36, 97], fn n ->
  IO.puts("phi(#{n}) = #{EulerTotient.phi(n)}")
end)
