defmodule Polygonal do
  def number(sides, n), do: div((sides - 2) * n * n - (sides - 4) * n, 2)
end

for {name, sides} <- [{"Triangular", 3}, {"Pentagonal", 5}, {"Hexagonal", 6}] do
  nums = Enum.map_join(1..10, " ", &Polygonal.number(sides, &1))
  IO.puts("#{name}: #{nums}")
end
