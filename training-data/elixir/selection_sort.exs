defmodule SelectionSort do
  def sort(list) when is_list(list) do
    do_sort(list, [])
  end

  defp do_sort([], acc), do: Enum.reverse(acc)

  defp do_sort(list, acc) do
    min = Enum.min(list)
    do_sort(List.delete(list, min), [min | acc])
  end
end

IO.inspect(SelectionSort.sort([5, 3, 8, 1, 9, 2]))
