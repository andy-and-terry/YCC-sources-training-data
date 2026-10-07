defmodule CounterResource do
  def stream(start, max) do
    Stream.resource(
      fn ->
        IO.puts("opening counter at #{start}")
        start
      end,
      fn
        current when current > max -> {:halt, current}
        current -> {[current], current + 1}
      end,
      fn current ->
        IO.puts("closing counter at #{current}")
      end
    )
  end
end

result =
  CounterResource.stream(1, 5)
  |> Stream.map(&(&1 * &1))
  |> Enum.to_list()

IO.inspect(result)
