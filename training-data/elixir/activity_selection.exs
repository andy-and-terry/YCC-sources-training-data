defmodule ActivitySelection do
  def select(activities) do
    activities
    |> Enum.sort_by(fn {_start, finish} -> finish end)
    |> Enum.reduce({[], 0}, fn {start, finish}, {selected, last_finish} ->
      if start >= last_finish do
        {[{start, finish} | selected], finish}
      else
        {selected, last_finish}
      end
    end)
    |> elem(0)
    |> Enum.reverse()
  end
end

activities = [{1, 3}, {2, 5}, {4, 6}, {6, 7}, {5, 8}, {8, 9}]
IO.inspect(ActivitySelection.select(activities))
