defmodule BestTimeToBuySellStock do
  def max_profit([]), do: 0

  def max_profit([first | rest]) do
    {_min_price, best_profit} =
      Enum.reduce(rest, {first, 0}, fn price, {min_price, best} ->
        new_min = min(min_price, price)
        new_best = max(best, price - min_price)
        {new_min, new_best}
      end)

    best_profit
  end
end

IO.puts(BestTimeToBuySellStock.max_profit([7, 1, 5, 3, 6, 4]))
