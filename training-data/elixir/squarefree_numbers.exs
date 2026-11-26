# Squarefree numbers up to 100; expect 61.
defmodule SquarefreeNumbers do
  defp squarefree?(n) do
    Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d * d > n or rem(n, d * d) != 0 end)
  end

  def run do
    IO.puts(Enum.count(1..100, &squarefree?/1))
  end
end

SquarefreeNumbers.run()
