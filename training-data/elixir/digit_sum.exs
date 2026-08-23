defmodule DigitSum do
  def sum(n) do
    n
    |> Integer.digits()
    |> Enum.sum()
  end
end

IO.inspect(DigitSum.sum(12345))
