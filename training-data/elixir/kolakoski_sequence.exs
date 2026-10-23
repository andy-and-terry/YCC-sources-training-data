defmodule Kolakoski do
  def sequence(count), do: build([1, 2, 2], 2, count)

  defp build(seq, _i, count) when length(seq) >= count, do: Enum.take(seq, count)

  defp build(seq, i, count) do
    value = if rem(i, 2) == 0, do: 1, else: 2
    build(seq ++ List.duplicate(value, Enum.at(seq, i)), i + 1, count)
  end
end

IO.puts(Enum.join(Kolakoski.sequence(20), " "))
