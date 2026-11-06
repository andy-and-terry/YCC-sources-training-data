# Highest value reached by the Collatz (hailstone) sequence from n.
defmodule Hailstone do
  def peak(n), do: peak(n, n)

  defp peak(1, best), do: best
  defp peak(n, best) do
    next = if rem(n, 2) == 0, do: div(n, 2), else: 3 * n + 1
    peak(next, max(best, next))
  end
end

IO.puts(Hailstone.peak(27))
