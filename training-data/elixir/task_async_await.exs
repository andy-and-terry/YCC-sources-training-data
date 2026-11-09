tasks = for i <- 1..4, do: Task.async(fn -> i * i end)
IO.inspect(Enum.map(tasks, &Task.await/1))
