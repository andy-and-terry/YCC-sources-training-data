defmodule VanEck do
  def sequence(count) do
    {seq, _last_seen} =
      Enum.reduce(0..(count - 2), {[0], %{}}, fn n, {[current | _] = acc, last_seen} ->
        next =
          case Map.fetch(last_seen, current) do
            {:ok, previous} -> n - previous
            :error -> 0
          end

        {[next | acc], Map.put(last_seen, current, n)}
      end)

    Enum.reverse(seq)
  end
end

IO.puts(Enum.join(VanEck.sequence(20), " "))
