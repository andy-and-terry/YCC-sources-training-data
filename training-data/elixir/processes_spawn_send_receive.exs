parent = self()

pids =
  for i <- 1..3 do
    spawn(fn ->
      receive do
        {:work, n} -> send(parent, {:done, i, n * n})
      end
    end)
  end

Enum.zip(pids, [2, 3, 4]) |> Enum.each(fn {pid, n} -> send(pid, {:work, n}) end)

results =
  for _ <- 1..3 do
    receive do
      {:done, i, r} -> {i, r}
    after
      1000 -> :timeout
    end
  end

IO.inspect(Enum.sort(results))
IO.inspect(Process.alive?(hd(pids)))
