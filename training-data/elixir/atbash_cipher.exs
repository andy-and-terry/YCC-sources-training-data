defmodule Atbash do
  def decode(text) do
    text
    |> String.downcase()
    |> String.to_charlist()
    |> Enum.filter(&(&1 in ?a..?z or &1 in ?0..?9))
    |> Enum.map(fn c when c in ?a..?z -> ?z - (c - ?a); c -> c end)
    |> List.to_string()
  end

  def encode(text) do
    text |> decode() |> String.graphemes() |> Enum.chunk_every(5) |> Enum.map_join(" ", &Enum.join/1)
  end
end

e = Atbash.encode("The quick brown fox")
IO.puts("#{e} -> #{Atbash.decode(e)}")
