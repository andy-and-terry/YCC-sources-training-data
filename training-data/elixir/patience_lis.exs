defmodule LIS do
  def length_of(list) do
    list
    |> Enum.reduce([], fn x, tails ->
      case Enum.find_index(tails, &(&1 >= x)) do
        nil -> tails ++ [x]
        i -> List.replace_at(tails, i, x)
      end
    end)
    |> length()
  end
end

IO.puts(LIS.length_of([10, 9, 2, 5, 3, 7, 101, 18]))
