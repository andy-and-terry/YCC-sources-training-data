1..5
|> Task.async_stream(fn n -> Process.sleep(10); n * n end, max_concurrency: 3)
|> Enum.map(fn {:ok, v} -> v end)
|> IO.inspect()
