defmodule Collatz do
  @moduledoc "Collatz sequences built lazily with Stream.unfold/2."

  def next(n) when rem(n, 2) == 0, do: div(n, 2)
  def next(n), do: 3 * n + 1

  def sequence(start) when start > 0 do
    start
    |> Stream.unfold(fn
      nil -> nil
      1 -> {1, nil}
      n -> {n, next(n)}
    end)
    |> Enum.to_list()
  end

  def steps(start), do: length(sequence(start)) - 1
end

IO.inspect(Collatz.sequence(6), label: "path for 6")
IO.puts("steps for 27: #{Collatz.steps(27)}")

{best, count} =
  1..10_000
  |> Enum.map(fn n -> {n, Collatz.steps(n)} end)
  |> Enum.max_by(fn {_n, s} -> s end)

IO.puts("longest chain under 10000: start #{best}, #{count} steps")
