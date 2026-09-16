defmodule RodCutting do
  def max_revenue(prices, length) do
    prices_map = prices |> Enum.with_index(1) |> Map.new(fn {price, len} -> {len, price} end)

    Enum.reduce(1..length, %{0 => 0}, fn n, best ->
      revenue =
        1..n
        |> Enum.map(fn cut -> Map.get(prices_map, cut, 0) + Map.get(best, n - cut, 0) end)
        |> Enum.max()

      Map.put(best, n, revenue)
    end)
    |> Map.get(length)
  end
end

prices = [1, 5, 8, 9, 10, 17, 17, 20]
IO.inspect(RodCutting.max_revenue(prices, 4))
IO.inspect(RodCutting.max_revenue(prices, 8))
