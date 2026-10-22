defmodule Kolakoski do
  def sequence(count), do: build([1, 2, 2], 2, count)

  defp build(seq, _i, count) when length(seq) >= count, do: Enum.take(seq, count)

  defp build(seq, i, count) do
    run = List.duplicate(3 - List.last(seq), Enum.at(seq, i))
    build(seq ++ run, i + 1, count)
  end
end

IO.puts(Enum.join(Kolakoski.sequence(20), " "))
