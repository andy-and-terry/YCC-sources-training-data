defmodule Wrap do
  def wrap(text, width) do
    text
    |> String.split()
    |> Enum.reduce([], fn
      word, [] -> [word]
      word, [line | rest] = lines ->
        if String.length(line) + 1 + String.length(word) > width,
          do: [word | lines],
          else: [line <> " " <> word | rest]
    end)
    |> Enum.reverse()
  end
end

for l <- Wrap.wrap("the quick brown fox jumps over the lazy dog", 15) do
  IO.puts("|" <> String.pad_trailing(l, 15) <> "|")
end
