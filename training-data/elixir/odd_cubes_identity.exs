defmodule OddCubes do
  def cube_from_odds(n) do
    start = n * n - n + 1
    Enum.sum(for i <- 0..(n - 1), do: start + 2 * i)
  end
end

for n <- 1..5 do
  IO.puts("#{n} #{OddCubes.cube_from_odds(n)} #{OddCubes.cube_from_odds(n) == n * n * n}")
end
