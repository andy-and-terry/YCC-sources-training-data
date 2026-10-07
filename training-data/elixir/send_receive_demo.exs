defmodule Echo do
  def loop do
    receive do
      {:echo, from, msg} ->
        send(from, {:reply, String.upcase(msg)})
        loop()

      :stop ->
        :ok
    after
      1_000 -> :timeout
    end
  end
end

pid = spawn(&Echo.loop/0)
send(pid, {:echo, self(), "hello"})

receive do
  {:reply, text} -> IO.puts(text)
after
  500 -> IO.puts("no reply")
end

send(pid, :stop)
Process.sleep(20)
IO.inspect(Process.alive?(pid))

# selective receive: pick the :high message first
send(self(), {:low, 1})
send(self(), {:high, 2})

receive do
  {:high, n} -> IO.puts("high #{n}")
end

receive do
  {:low, n} -> IO.puts("low #{n}")
end
