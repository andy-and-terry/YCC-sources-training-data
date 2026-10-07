worker =
  spawn(fn ->
    receive do
      :crash -> raise "worker crashed"
      :finish -> :ok
    end
  end)

ref = Process.monitor(worker)
send(worker, :crash)

receive do
  {:DOWN, ^ref, :process, ^worker, reason} ->
    IO.inspect({:worker_down, reason})
end
