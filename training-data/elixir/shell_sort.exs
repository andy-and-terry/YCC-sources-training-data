defmodule ShellSort do
  def sort(list) do
    array = List.to_tuple(list)
    n = tuple_size(array)
    gap = div(n, 2)
    result = gap_pass(array, n, gap)
    Tuple.to_list(result)
  end

  defp gap_pass(array, _n, 0), do: array

  defp gap_pass(array, n, gap) do
    array = insertion_for_gap(array, n, gap, gap)
    gap_pass(array, n, div(gap, 2))
  end

  defp insertion_for_gap(array, n, _gap, i) when i >= n, do: array

  defp insertion_for_gap(array, n, gap, i) do
    array = shift(array, gap, i)
    insertion_for_gap(array, n, gap, i + 1)
  end

  defp shift(array, gap, j) when j < gap, do: array

  defp shift(array, gap, j) do
    if elem(array, j - gap) > elem(array, j) do
      array
      |> swap(j - gap, j)
      |> shift(gap, j - gap)
    else
      array
    end
  end

  defp swap(array, i, j) do
    a = elem(array, i)
    b = elem(array, j)
    array |> put_elem(i, b) |> put_elem(j, a)
  end
end

IO.inspect(ShellSort.sort([9, 5, 1, 4, 8, 3, 7, 2, 6]))
