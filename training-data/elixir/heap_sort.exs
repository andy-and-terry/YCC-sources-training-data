defmodule HeapSort do
  def sort(list) do
    heap = :lists.foldl(&push/2, [], list)
    pop_all(heap, [])
  end

  defp push(x, heap), do: sift_up(heap ++ [x], length(heap))

  defp sift_up(heap, i) when i == 0, do: heap

  defp sift_up(heap, i) do
    parent = div(i - 1, 2)

    if Enum.at(heap, parent) > Enum.at(heap, i) do
      heap
      |> swap(parent, i)
      |> sift_up(parent)
    else
      heap
    end
  end

  defp swap(list, i, j) do
    a = Enum.at(list, i)
    b = Enum.at(list, j)

    list
    |> List.replace_at(i, b)
    |> List.replace_at(j, a)
  end

  defp pop_all([], acc), do: Enum.reverse(acc)

  defp pop_all(heap, acc) do
    [min | rest] = heap
    pop_all(rebuild(rest), [min | acc])
  end

  defp rebuild([]), do: []

  defp rebuild(list) do
    Enum.sort(list)
  end
end

IO.inspect(HeapSort.sort([5, 3, 8, 1, 9, 2]))
