tasks =
  for n <- 1..4 do
    Task.async(fn -> n * n end)
  end

IO.inspect(Task.await_many(tasks))

IO.inspect(Task.async_stream(1..3, &(&1 + 100)) |> Enum.map(fn {:ok, v} -> v end))
