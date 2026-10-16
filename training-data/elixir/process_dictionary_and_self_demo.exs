Process.put(:key, "value")
IO.inspect(Process.get(:key))
IO.inspect(Process.get(:missing, :default))
IO.inspect(is_pid(self()))

parent = self()

spawn(fn ->
  send(parent, {:child_dict, Process.get(:key)})
end)

receive do
  {:child_dict, v} -> IO.inspect(v)
after
  500 -> IO.puts("timeout")
end
