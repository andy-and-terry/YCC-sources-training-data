defmodule Delannoy do
  # D(m, n) = D(m-1, n) + D(m, n-1) + D(m-1, n-1), memoised in a map.
  def central(n) do
    grid =
      for i <- 0..n, j <- 0..n, reduce: %{} do
        acc ->
          v = if i == 0 or j == 0, do: 1, else: acc[{i - 1, j}] + acc[{i, j - 1}] + acc[{i - 1, j - 1}]
          Map.put(acc, {i, j}, v)
      end

    grid[{n, n}]
  end
end

IO.puts(Enum.map_join(0..5, " ", &Delannoy.central/1)) # 1 3 13 63 321 1683
