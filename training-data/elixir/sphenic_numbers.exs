defmodule Sphenic do
  def factors(n), do: factors(n, 2, [])

  defp factors(1, _p, acc), do: acc
  defp factors(n, p, acc) when p * p > n, do: [n | acc]
  defp factors(n, p, acc) when rem(n, p) == 0, do: factors(div(n, p), p, [p | acc])
  defp factors(n, p, acc), do: factors(n, p + 1, acc)

  def sphenic?(n) do
    fs = factors(n)
    length(fs) == 3 and length(Enum.uniq(fs)) == 3
  end
end

2..79 |> Enum.filter(&Sphenic.sphenic?/1) |> IO.inspect()
