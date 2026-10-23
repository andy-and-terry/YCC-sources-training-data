defmodule Ulam do
  def sequence(count), do: build([1, 2], 3, count)

  defp build(seq, _candidate, count) when length(seq) >= count, do: seq

  defp build(seq, candidate, count) do
    ways =
      for {x, i} <- Enum.with_index(seq),
          y <- Enum.drop(seq, i + 1),
          x + y == candidate,
          do: 1

    if length(ways) == 1,
      do: build(seq ++ [candidate], candidate + 1, count),
      else: build(seq, candidate + 1, count)
  end
end

IO.puts(Enum.join(Ulam.sequence(15), " "))
