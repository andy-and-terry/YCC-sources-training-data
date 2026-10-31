defmodule Powerful do
  def factors(n), do: factors(n, 2, [])

  defp factors(1, _p, acc), do: acc
  defp factors(n, p, acc) when p * p > n, do: [n | acc]
  defp factors(n, p, acc) when rem(n, p) == 0, do: factors(div(n, p), p, [p | acc])
  defp factors(n, p, acc), do: factors(n, p + 1, acc)

  def powerful?(n) do
    factors(n) |> Enum.frequencies() |> Map.values() |> Enum.all?(&(&1 >= 2))
  end
end

1..100 |> Enum.filter(&Powerful.powerful?/1) |> Enum.join(" ") |> IO.puts()
