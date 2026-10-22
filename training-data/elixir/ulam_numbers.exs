defmodule Ulam do
  def sequence(count), do: build([1, 2], 3, count)

  defp build(seq, _n, count) when length(seq) >= count, do: seq

  defp build(seq, n, count) do
    ways = Enum.count(seq, fn a -> n - a > a and Enum.member?(seq, n - a) end)

    if ways == 1 do
      build(seq ++ [n], n + 1, count)
    else
      build(seq, n + 1, count)
    end
  end
end

IO.puts(Enum.join(Ulam.sequence(15), " "))
