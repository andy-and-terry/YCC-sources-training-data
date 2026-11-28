defmodule MostWater do
  def max_area(heights) do
    t = List.to_tuple(heights)
    go(t, 0, tuple_size(t) - 1, 0)
  end

  defp go(_t, lo, hi, best) when lo >= hi, do: best

  defp go(t, lo, hi, best) do
    {a, b} = {elem(t, lo), elem(t, hi)}
    best = max(best, min(a, b) * (hi - lo))
    if a < b, do: go(t, lo + 1, hi, best), else: go(t, lo, hi - 1, best)
  end
end

IO.puts(MostWater.max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])) # 49
