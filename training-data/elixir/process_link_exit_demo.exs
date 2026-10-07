Process.flag(:trap_exit, true)

pid = spawn_link(fn -> exit(:boom) end)

receive do
  {:EXIT, ^pid, reason} -> IO.puts("linked process exited: #{inspect(reason)}")
end

pid2 = spawn_link(fn -> raise "oops" end)

receive do
  {:EXIT, ^pid2, {%RuntimeError{message: msg}, _stack}} ->
    IO.puts("crashed with: #{msg}")
end

pid3 = spawn_link(fn -> :ok end)

receive do
  {:EXIT, ^pid3, :normal} -> IO.puts("normal exit")
end
