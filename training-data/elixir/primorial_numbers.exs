# Primorials up to 1e6, including 1; expect 8.
defmodule PrimorialNumbers do
  defp prime?(n) when n < 2, do: false
  defp prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)

  def run do
    values =
      Stream.iterate(2, &(&1 + 1))
      |> Stream.filter(&prime?/1)
      |> Stream.scan(1, &(&1 * &2))
      |> Enum.take_while(&(&1 <= 1_000_000))

    IO.inspect({length(values) + 1, [1 | values]})
  end
end

PrimorialNumbers.run()
