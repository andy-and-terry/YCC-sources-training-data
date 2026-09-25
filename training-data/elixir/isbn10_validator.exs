defmodule Isbn10 do
  def valid?(isbn) do
    s = String.replace(isbn, "-", "")

    if s =~ ~r/^\d{9}[\dX]$/ do
      s
      |> String.graphemes()
      |> Enum.zip(10..1//-1)
      |> Enum.map(fn {"X", w} -> 10 * w; {c, w} -> String.to_integer(c) * w end)
      |> Enum.sum()
      |> rem(11) == 0
    else
      false
    end
  end
end

for s <- ~w(3-598-21508-8 3-598-21507-X 3-598-21508-9), do: IO.puts("#{s} #{Isbn10.valid?(s)}")
