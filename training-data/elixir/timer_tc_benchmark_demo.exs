# :timer.tc/1 returns {microseconds, result} for a function call.
{micros, result} = :timer.tc(fn -> Enum.sum(1..100_000) end)
IO.puts("sum = #{result}")
IO.puts("took a non-negative time: #{micros >= 0}")

# :timer.tc/3 takes module, function, args
{_, sorted} = :timer.tc(Enum, :sort, [[3, 1, 2]])
IO.inspect(sorted)

# Small helper to compare two implementations
defmodule Bench do
  def time(label, fun) do
    {micros, value} = :timer.tc(fun)
    IO.puts("#{label}: result=#{inspect(value)} fast_enough=#{micros < 5_000_000}")
    micros
  end
end

list = Enum.to_list(1..2_000)

t1 = Bench.time("Enum.reverse", fn -> Enum.reverse(list) |> hd() end)
t2 = Bench.time("List.last", fn -> List.last(list) end)
IO.puts("both measured: #{is_integer(t1) and is_integer(t2)}")

# Monotonic clock for manual timing
start = System.monotonic_time(:microsecond)
Enum.each(1..1000, fn _ -> :ok end)
elapsed = System.monotonic_time(:microsecond) - start
IO.puts("elapsed is positive: #{elapsed >= 0}")
