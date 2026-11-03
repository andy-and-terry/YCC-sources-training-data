defmodule PerfectSquare do
  def perfect_square?(n) when n < 0, do: false

  def perfect_square?(n) do
    r = n |> :math.sqrt() |> round()
    r * r == n
  end
end

IO.inspect(Enum.filter(0..29, &PerfectSquare.perfect_square?/1))
