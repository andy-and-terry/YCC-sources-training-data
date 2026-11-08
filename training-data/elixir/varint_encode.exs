defmodule Varint do
  import Bitwise

  def encode(n) when n < 128, do: [n]
  def encode(n), do: [(n &&& 127) ||| 128 | encode(n >>> 7)]
end

IO.inspect(Varint.encode(300))
