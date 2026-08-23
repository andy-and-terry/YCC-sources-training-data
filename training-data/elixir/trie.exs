defmodule Trie do
  def new, do: %{}

  def insert(trie, word) do
    chars = String.graphemes(word)
    put_in_path(trie, chars)
  end

  defp put_in_path(trie, []), do: Map.put(trie, :is_end, true)

  defp put_in_path(trie, [c | rest]) do
    child = Map.get(trie, c, %{})
    Map.put(trie, c, put_in_path(child, rest))
  end

  def contains?(trie, word) do
    chars = String.graphemes(word)
    walk(trie, chars)
  end

  defp walk(trie, []), do: Map.get(trie, :is_end, false)

  defp walk(trie, [c | rest]) do
    case Map.fetch(trie, c) do
      {:ok, child} -> walk(child, rest)
      :error -> false
    end
  end
end

trie = Trie.new() |> Trie.insert("cat") |> Trie.insert("car")
IO.inspect(Trie.contains?(trie, "cat"))
IO.inspect(Trie.contains?(trie, "ca"))
