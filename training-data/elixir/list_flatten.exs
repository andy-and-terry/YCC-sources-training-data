defmodule Flatten do
  def flatten([]), do: []
  def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  def flatten(leaf), do: [leaf]

  # Accumulator version, avoids repeated ++
  def flatten_acc(list), do: do_flat(list, []) |> Enum.reverse()

  defp do_flat([], acc), do: acc
  defp do_flat([h | t], acc), do: do_flat(t, do_flat(h, acc))
  defp do_flat(leaf, acc), do: [leaf | acc]
end

nested = [1, [2, [3, [4, 5]], 6], [[7]], 8]
IO.inspect(Flatten.flatten(nested))
IO.inspect(Flatten.flatten_acc(nested))
IO.inspect(List.flatten(nested) == Flatten.flatten(nested))
