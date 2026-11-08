tasks = for n <- 1..4, do: Task.async(fn -> n * n end)
IO.inspect(Task.await_many(tasks))
