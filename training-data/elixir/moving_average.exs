defmodule MovingAverage do
  defstruct size: 3, window: :queue.new(), count: 0, sum: 0

  def new(size), do: %__MODULE__{size: size}

  def next(%__MODULE__{} = ma, v) do
    window = :queue.in(v, ma.window)
    {window, count, sum} =
      if ma.count == ma.size do
        {{:value, old}, w} = :queue.out(window)
        {w, ma.count, ma.sum + v - old}
      else
        {window, ma.count + 1, ma.sum + v}
      end

    ma = %{ma | window: window, count: count, sum: sum}
    {sum / count, ma}
  end
end

{avgs, _} = Enum.map_reduce([1, 10, 3, 5, 8, 2], MovingAverage.new(3), &MovingAverage.next(&2, &1))
IO.inspect(Enum.map(avgs, &Float.round(&1, 2)))
