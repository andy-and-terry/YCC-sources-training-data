defmodule TaskAsyncStreamDemo do
  def run do
    1..5
    |> Task.async_stream(fn n -> n * n end)
    |> Enum.map(fn {:ok, result} -> result end)
    |> IO.inspect()
  end
end

TaskAsyncStreamDemo.run()
