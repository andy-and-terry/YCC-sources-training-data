defmodule EvenSet do
  defstruct values: MapSet.new()
end

defimpl Collectable, for: EvenSet do
  def into(%EvenSet{values: values}) do
    collector_fun = fn
      acc, {:cont, elem} when rem(elem, 2) == 0 -> MapSet.put(acc, elem)
      acc, {:cont, _elem} -> acc
      acc, :done -> %EvenSet{values: acc}
      _acc, :halt -> :ok
    end

    {values, collector_fun}
  end
end

result = Enum.into(1..10, %EvenSet{})
IO.inspect(MapSet.to_list(result.values) |> Enum.sort())

combined = Enum.into([11, 12, 13, 14], result, & &1)
IO.inspect(MapSet.to_list(combined.values) |> Enum.sort())
