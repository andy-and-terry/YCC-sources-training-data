defmodule BubbleSort do
  def sort(list) do
    do_sort(list, length(list))
  end

  defp do_sort(list, 0), do: list

  defp do_sort(list, n) do
    {new_list, _} =
      Enum.reduce(1..(n - 1), {list, false}, fn i, {acc, _} ->
        a = Enum.at(acc, i - 1)
        b = Enum.at(acc, i)

        if a > b do
          {List.replace_at(List.replace_at(acc, i - 1, b), i, a), true}
        else
          {acc, false}
        end
      end)

    do_sort(new_list, n - 1)
  end
end

IO.inspect(BubbleSort.sort([5, 2, 9, 1, 5, 6]))
