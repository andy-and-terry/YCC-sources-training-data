defmodule Knapsack do
  def solve(items, capacity) do
    Enum.reduce(items, %{0 => 0}, fn {weight, value}, table ->
      Enum.reduce(capacity..0//-1, table, fn cap, acc ->
        if weight <= cap do
          without = Map.get(acc, cap, 0)
          with_item = Map.get(acc, cap - weight, 0) + value
          Map.put(acc, cap, max(without, with_item))
        else
          acc
        end
      end)
    end)
    |> Map.get(capacity, 0)
  end
end

items = [{2, 3}, {3, 4}, {4, 5}, {5, 6}]
IO.inspect(Knapsack.solve(items, 5))
