defmodule MergeIntervals do
  def merge(intervals) do
    intervals
    |> Enum.sort_by(fn {start, _end} -> start end)
    |> Enum.reduce([], fn {start, finish}, acc ->
      case acc do
        [{prev_start, prev_end} | rest] when start <= prev_end ->
          [{prev_start, max(prev_end, finish)} | rest]

        _ ->
          [{start, finish} | acc]
      end
    end)
    |> Enum.reverse()
  end
end

IO.inspect(MergeIntervals.merge([{1, 3}, {2, 6}, {8, 10}, {15, 18}]))
