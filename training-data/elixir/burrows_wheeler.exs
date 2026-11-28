defmodule BWT do
  def encode(s) do
    n = String.length(s)

    0..(n - 1)
    |> Enum.map(fn i -> String.slice(s, i..-1//1) <> String.slice(s, 0, i) end)
    |> Enum.sort()
    |> Enum.map_join(&String.last/1)
  end
end

IO.puts(BWT.encode("banana$"))
