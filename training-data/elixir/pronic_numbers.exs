defmodule Pronic do
  def pronic?(x) do
    n = x |> :math.sqrt() |> trunc()
    n * (n + 1) == x
  end
end

IO.inspect(for n <- 0..9, do: n * (n + 1)) # [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
IO.inspect({Pronic.pronic?(56), Pronic.pronic?(57)}) # {true, false}
