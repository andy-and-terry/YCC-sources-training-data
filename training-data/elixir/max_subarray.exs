defmodule MaxSubarray do
  def kadane(list) do
    [head | tail] = list

    {best, _current} =
      Enum.reduce(tail, {head, head}, fn x, {best, current} ->
        current = max(x, current + x)
        {max(best, current), current}
      end)

    best
  end
end

IO.inspect(MaxSubarray.kadane([-2, 1, -3, 4, -1, 2, 1, -5, 4]))
