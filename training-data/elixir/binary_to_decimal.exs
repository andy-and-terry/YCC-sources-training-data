defmodule BinaryToDecimal do
  def convert(binary_str) do
    binary_str
    |> String.to_integer(2)
  end

  def manual_convert(binary_str) do
    binary_str
    |> String.graphemes()
    |> Enum.reduce(0, fn bit, acc -> acc * 2 + String.to_integer(bit) end)
  end
end

IO.inspect(BinaryToDecimal.convert("1011"))
IO.inspect(BinaryToDecimal.manual_convert("1011"))
