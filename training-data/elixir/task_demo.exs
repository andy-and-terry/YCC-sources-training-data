defmodule TaskDemo do
  def run do
    task = Task.async(fn -> Enum.sum(1..1_000_000) end)
    result = Task.await(task)
    IO.inspect(result)
  end
end

TaskDemo.run()
