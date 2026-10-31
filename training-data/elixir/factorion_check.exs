defmodule Factorion do
  @fact List.to_tuple([1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880])

  def factorion?(n) do
    n == n |> Integer.digits() |> Enum.map(&elem(@fact, &1)) |> Enum.sum()
  end
end

1..49_999 |> Enum.filter(&Factorion.factorion?/1) |> IO.inspect()
