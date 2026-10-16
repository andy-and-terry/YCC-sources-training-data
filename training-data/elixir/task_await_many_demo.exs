tasks =
  for n <- 1..4 do
    Task.async(fn ->
      Process.sleep(10 * (5 - n))
      n * n
    end)
  end

IO.inspect(Task.await_many(tasks))

t = Task.async(fn -> Process.sleep(200) end)

case Task.yield(t, 20) || Task.shutdown(t) do
  {:ok, _} -> IO.puts("finished")
  nil -> IO.puts("shut down slow task")
end
