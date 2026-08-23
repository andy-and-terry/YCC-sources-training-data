defmodule CoinChange do
  def min_coins(coins, amount) do
    table =
      Enum.reduce(0..amount, %{0 => 0}, fn n, acc ->
        best =
          coins
          |> Enum.filter(&(&1 <= n))
          |> Enum.map(&Map.get(acc, n - &1, :infinity))
          |> Enum.reject(&(&1 == :infinity))
          |> case do
            [] -> :infinity
            options -> Enum.min(options) + 1
          end

        Map.put(acc, n, best)
      end)

    Map.get(table, amount)
  end
end

IO.inspect(CoinChange.min_coins([1, 2, 5], 11))
