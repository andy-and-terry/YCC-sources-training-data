defmodule Cleanup do
  def run(fun) do
    try do
      IO.puts("start")
      fun.()
    rescue
      e in ArithmeticError -> {:rescued, Exception.message(e)}
      e in KeyError -> {:rescued, e.key}
    catch
      :throw, value -> {:thrown, value}
      :exit, reason -> {:exited, reason}
    else
      result -> {:ok, result}
    after
      IO.puts("cleanup always runs")
    end
  end
end

IO.inspect(Cleanup.run(fn -> 10 + 1 end))
IO.inspect(Cleanup.run(fn -> 1 / 0 end))
IO.inspect(Cleanup.run(fn -> Map.fetch!(%{}, :nope) end))
IO.inspect(Cleanup.run(fn -> throw(:early_exit) end))
IO.inspect(Cleanup.run(fn -> exit(:shutdown) end))
