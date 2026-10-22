defmodule Aliquot do
  def sequence(0), do: [0]
  def sequence(n), do: [n | sequence(proper_divisor_sum(n))]

  defp proper_divisor_sum(n) when n < 2, do: 0

  defp proper_divisor_sum(n) do
    1..div(n, 2) |> Enum.filter(&(rem(n, &1) == 0)) |> Enum.sum()
  end
end

IO.puts(Enum.join(Aliquot.sequence(12), " "))
