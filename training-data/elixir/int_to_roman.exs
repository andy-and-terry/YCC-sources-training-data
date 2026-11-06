# Integer (1..3999) to Roman numeral using a greedy table.
defmodule Roman do
  @table [
    {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"},
    {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}
  ]

  def to_roman(n) do
    {_, out} =
      Enum.reduce(@table, {n, ""}, fn {value, symbol}, {rest, acc} ->
        {rem(rest, value), acc <> String.duplicate(symbol, div(rest, value))}
      end)

    out
  end
end

IO.puts("#{Roman.to_roman(1994)} #{Roman.to_roman(58)}")
