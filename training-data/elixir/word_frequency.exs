defmodule WordFrequency do
  def count(text) do
    text
    |> String.downcase()
    |> String.split(~r/[^a-z0-9]+/, trim: true)
    |> Enum.frequencies()
  end
end

IO.inspect(WordFrequency.count("the quick brown fox the lazy fox"))
