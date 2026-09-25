defmodule BinaryGap do
  def gap(n) do
    n
    |> Integer.to_string(2)
    |> String.trim_trailing("0")
    |> String.split("1")
    |> Enum.map(&String.length/1)
    |> Enum.max(fn -> 0 end)
  end
end

for n <- [9, 529, 20, 15, 1041], do: IO.puts("#{n} #{Integer.to_string(n, 2)} #{BinaryGap.gap(n)}")
