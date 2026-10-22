defmodule Golomb do
  def sequence(count) do
    g = Enum.reduce(2..count, %{1 => 1}, fn n, g ->
      Map.put(g, n, 1 + g[n - g[g[n - 1]]])
    end)

    Enum.map(1..count, &g[&1])
  end
end

IO.puts(Enum.join(Golomb.sequence(20), " "))
