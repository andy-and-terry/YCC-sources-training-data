# Emirps below 200; expect 15.
defmodule Emirps do
  defp prime?(n) when n < 2, do: false
  defp prime?(n), do: Enum.all?(2..max(2, trunc(:math.sqrt(n))), fn d -> d == n or rem(n, d) != 0 end)

  def run do
    rev = fn n -> n |> Integer.to_string() |> String.reverse() |> String.to_integer() end
    found = Enum.filter(2..199, fn n -> rev.(n) != n and prime?(n) and prime?(rev.(n)) end)
    IO.inspect({length(found), found})
  end
end

Emirps.run()
