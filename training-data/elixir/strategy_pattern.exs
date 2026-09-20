defmodule SortStrategies do
  def ascending(list), do: Enum.sort(list)
  def descending(list), do: Enum.sort(list, :desc)
end

defmodule Sorter do
  def execute(list, strategy) when is_function(strategy, 1), do: strategy.(list)
end

data = [5, 3, 8, 1, 9, 2]

IO.inspect(Sorter.execute(data, &SortStrategies.ascending/1))
IO.inspect(Sorter.execute(data, &SortStrategies.descending/1))
IO.inspect(Sorter.execute(data, fn list -> Enum.shuffle(list) |> Enum.sort() end))
