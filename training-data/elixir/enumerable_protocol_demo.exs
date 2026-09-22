defmodule Range3 do
  defstruct from: 0, to: 0, step: 1
end

defimpl Enumerable, for: Range3 do
  def count(%Range3{from: from, to: to, step: step}) do
    {:ok, max(0, div(to - from, step) + 1)}
  end

  def member?(%Range3{from: from, to: to, step: step}, value) do
    {:ok, value >= from and value <= to and rem(value - from, step) == 0}
  end

  def slice(_range3), do: {:error, __MODULE__}

  def reduce(%Range3{from: from, to: to, step: step}, acc, fun) do
    do_reduce(from, to, step, acc, fun)
  end

  defp do_reduce(_current, _to, _step, {:halt, acc}, _fun) do
    {:halted, acc}
  end

  defp do_reduce(current, to, step, {:suspend, acc}, fun) do
    {:suspended, acc, &do_reduce(current, to, step, &1, fun)}
  end

  defp do_reduce(current, to, _step, {:cont, acc}, _fun) when current > to do
    {:done, acc}
  end

  defp do_reduce(current, to, step, {:cont, acc}, fun) do
    do_reduce(current + step, to, step, fun.(current, acc), fun)
  end
end

evens = %Range3{from: 0, to: 20, step: 2}

IO.inspect(Enum.to_list(evens))
IO.inspect(Enum.sum(evens))
IO.inspect(Enum.member?(evens, 10))
IO.inspect(Enum.count(evens))
IO.inspect(Enum.map(evens, &(&1 * &1)))
