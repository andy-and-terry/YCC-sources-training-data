defmodule BitReversal do
  import Bitwise

  def reverse(value, width \\ 8) do
    Enum.reduce(0..(width - 1), 0, fn i, acc -> (acc <<< 1) ||| (value >>> i &&& 1) end)
  end
end

for v <- [1, 6, 13, 128], do: IO.puts("#{v} #{BitReversal.reverse(v)}") # 128 96 176 1
