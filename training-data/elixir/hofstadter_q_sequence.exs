defmodule HofstadterQ do
  def sequence(count) do
    q = Enum.reduce(3..count, %{1 => 1, 2 => 1}, fn n, q ->
      Map.put(q, n, q[n - q[n - 1]] + q[n - q[n - 2]])
    end)

    Enum.map(1..count, &q[&1])
  end
end

IO.puts(Enum.join(HofstadterQ.sequence(20), " "))
