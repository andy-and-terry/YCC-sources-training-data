defmodule MinHeap do
  defstruct data: []

  def new, do: %MinHeap{data: []}

  def insert(%MinHeap{data: data}, value) do
    data = data ++ [value]
    %MinHeap{data: sift_up(data, length(data) - 1)}
  end

  def extract_min(%MinHeap{data: []}), do: {:error, :empty}

  def extract_min(%MinHeap{data: [min | rest]}) do
    case rest do
      [] ->
        {:ok, min, %MinHeap{data: []}}

      _ ->
        last = List.last(rest)
        data = [last | List.delete_at(rest, length(rest) - 1)]
        {:ok, min, %MinHeap{data: sift_down(data, 0)}}
    end
  end

  defp sift_up(data, 0), do: data

  defp sift_up(data, index) do
    parent = div(index - 1, 2)

    if Enum.at(data, index) < Enum.at(data, parent) do
      data |> swap(index, parent) |> sift_up(parent)
    else
      data
    end
  end

  defp sift_down(data, index) do
    size = length(data)
    left = 2 * index + 1
    right = 2 * index + 2

    smallest =
      [index, left, right]
      |> Enum.filter(&(&1 < size))
      |> Enum.min_by(&Enum.at(data, &1))

    if smallest != index do
      data |> swap(index, smallest) |> sift_down(smallest)
    else
      data
    end
  end

  defp swap(data, i, j) do
    vi = Enum.at(data, i)
    vj = Enum.at(data, j)
    data |> List.replace_at(i, vj) |> List.replace_at(j, vi)
  end
end

heap =
  Enum.reduce([5, 3, 8, 1, 9, 2], MinHeap.new(), fn value, acc ->
    MinHeap.insert(acc, value)
  end)

{:ok, min1, heap} = MinHeap.extract_min(heap)
{:ok, min2, heap} = MinHeap.extract_min(heap)
{:ok, min3, _heap} = MinHeap.extract_min(heap)

IO.inspect({min1, min2, min3})
