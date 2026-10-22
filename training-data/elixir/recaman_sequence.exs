defmodule Recaman do
  def sequence(count) do
    {seq, _seen} =
      Enum.reduce(1..(count - 1), {[0], MapSet.new([0])}, fn n, {[prev | _] = acc, seen} ->
        back = prev - n
        next = if back > 0 and not MapSet.member?(seen, back), do: back, else: prev + n
        {[next | acc], MapSet.put(seen, next)}
      end)

    Enum.reverse(seq)
  end
end

IO.puts(Enum.join(Recaman.sequence(20), " "))
