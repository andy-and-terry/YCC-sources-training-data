result =
  try do
    exit(:shutdown)
  catch
    :exit, reason -> {:caught_exit, reason}
  end

IO.inspect(result)

result2 =
  try do
    throw(:early)
  catch
    :throw, value -> {:thrown, value}
  end

IO.inspect(result2)

result3 =
  try do
    raise "oops"
  rescue
    e in RuntimeError -> {:rescued, e.message}
  else
    _ -> :unreachable
  after
    IO.puts("after runs")
  end

IO.inspect(result3)
