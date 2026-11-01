# Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
defmodule RuthAaron do
  def sopfr(n), do: sopfr(n, 2, 0)

  defp sopfr(1, _p, acc), do: acc
  defp sopfr(n, p, acc) when p * p > n, do: acc + n
  defp sopfr(n, p, acc) when rem(n, p) == 0, do: sopfr(div(n, p), p, acc + p)
  defp sopfr(n, p, acc), do: sopfr(n, p + 1, acc)
end

2..109
|> Enum.filter(fn n -> RuthAaron.sopfr(n) == RuthAaron.sopfr(n + 1) end)
|> Enum.join(" ")
|> IO.puts()
