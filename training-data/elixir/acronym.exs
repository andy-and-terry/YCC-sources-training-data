defmodule Acronym do
  def abbreviate(phrase) do
    ~r/[A-Za-z][A-Za-z']*/
    |> Regex.scan(phrase)
    |> Enum.map_join(fn [word] -> word |> String.first() |> String.upcase() end)
  end
end

IO.puts(Acronym.abbreviate("Portable Network Graphics"))
IO.puts(Acronym.abbreviate("Complementary metal-oxide semiconductor"))
