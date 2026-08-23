defmodule BinarySearch do
  def search(list, target) do
    tuple = List.to_tuple(list)
    do_search(tuple, target, 0, tuple_size(tuple) - 1)
  end

  defp do_search(_tuple, _target, low, high) when low > high, do: -1

  defp do_search(tuple, target, low, high) do
    mid = div(low + high, 2)
    value = elem(tuple, mid)

    cond do
      value == target -> mid
      value < target -> do_search(tuple, target, mid + 1, high)
      true -> do_search(tuple, target, low, mid - 1)
    end
  end
end

IO.inspect(BinarySearch.search([1, 3, 5, 7, 9, 11], 7))
IO.inspect(BinarySearch.search([1, 3, 5, 7, 9, 11], 4))
