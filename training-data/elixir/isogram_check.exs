defmodule Isogram do
  def isogram?(word) do
    letters = word |> String.downcase() |> String.replace(~r/[^a-z]/, "") |> String.graphemes()
    length(letters) == length(Enum.uniq(letters))
  end
end

for w <- ~w(lumberjacks background six-year-old isograms), do: IO.puts("#{w} #{Isogram.isogram?(w)}")
