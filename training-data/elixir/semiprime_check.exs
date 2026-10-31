defmodule Semiprime do
  def factors(n), do: factors(n, 2, [])

  defp factors(1, _p, acc), do: acc
  defp factors(n, p, acc) when p * p > n, do: [n | acc]
  defp factors(n, p, acc) when rem(n, p) == 0, do: factors(div(n, p), p, [p | acc])
  defp factors(n, p, acc), do: factors(n, p + 1, acc)

  def semiprime?(n), do: length(factors(n)) == 2
end

2..29 |> Enum.filter(&Semiprime.semiprime?/1) |> IO.inspect()
