defmodule Smith do
  def digit_sum(n), do: n |> Integer.digits() |> Enum.sum()

  def prime_factors(n), do: factors(n, 2)

  defp factors(n, _p) when n < 2, do: []
  defp factors(n, p) when p * p > n, do: [n]
  defp factors(n, p) when rem(n, p) == 0, do: [p | factors(div(n, p), p)]
  defp factors(n, p), do: factors(n, p + 1)

  def smith?(n) do
    fs = prime_factors(n)
    length(fs) > 1 and fs |> Enum.map(&digit_sum/1) |> Enum.sum() == digit_sum(n)
  end
end

2..99
|> Enum.filter(&Smith.smith?/1)
|> Enum.join(" ")
|> IO.puts()
