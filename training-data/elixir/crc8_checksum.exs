defmodule Crc8 do
  import Bitwise

  def crc8(bin), do: bin |> :binary.bin_to_list() |> Enum.reduce(0, &byte/2)

  defp byte(b, crc), do: Enum.reduce(1..8, bxor(crc, b), fn _, c -> step(c) end)
  defp step(c) when (c &&& 0x80) != 0, do: ((c <<< 1) ^^^ 0x07) &&& 0xFF
  defp step(c), do: (c <<< 1) &&& 0xFF
end

IO.puts(Integer.to_string(Crc8.crc8("123456789"), 16))
