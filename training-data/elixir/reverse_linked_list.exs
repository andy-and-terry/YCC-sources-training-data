defmodule LinkedList do
  defstruct value: nil, next: nil

  def from_list(list), do: Enum.reduce(Enum.reverse(list), nil, fn v, acc -> %LinkedList{value: v, next: acc} end)

  def to_list(nil), do: []
  def to_list(%LinkedList{value: v, next: n}), do: [v | to_list(n)]

  def reverse(list), do: reverse(list, nil)
  defp reverse(nil, acc), do: acc
  defp reverse(%LinkedList{value: v, next: n}, acc), do: reverse(n, %LinkedList{value: v, next: acc})
end

list = LinkedList.from_list([1, 2, 3, 4, 5])
reversed = LinkedList.reverse(list)
IO.inspect(LinkedList.to_list(reversed))
