defmodule Ordinal do
  def of(n) when rem(n, 100) in 11..13, do: "#{n}th"
  def of(n) do
    case rem(n, 10) do
      1 -> "#{n}st"
      2 -> "#{n}nd"
      3 -> "#{n}rd"
      _ -> "#{n}th"
    end
  end
end

[1, 2, 3, 4, 11, 12, 13, 21, 101, 111] |> Enum.map_join(" ", &Ordinal.of/1) |> IO.puts()
