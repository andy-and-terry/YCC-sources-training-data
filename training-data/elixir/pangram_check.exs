defmodule Pangram do
  def pangram?(sentence) do
    letters = sentence |> String.downcase() |> String.graphemes() |> MapSet.new()
    Enum.all?(?a..?z, &MapSet.member?(letters, <<&1>>))
  end
end

IO.inspect(Pangram.pangram?("The quick brown fox jumps over the lazy dog"))
IO.inspect(Pangram.pangram?("Hello world"))
