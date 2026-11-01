1..5
|> Task.async_stream(fn n -> n * n end, max_concurrency: 2)
|> Enum.map(fn {:ok, v} -> v end)
|> IO.inspect()
