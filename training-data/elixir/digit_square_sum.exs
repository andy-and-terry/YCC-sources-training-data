defmodule DigitSquareSum do
  def compute(n), do: n |> abs() |> Integer.digits() |> Enum.map(&(&1 * &1)) |> Enum.sum()
end

IO.puts(DigitSquareSum.compute(123))
IO.puts(DigitSquareSum.compute(-99))
