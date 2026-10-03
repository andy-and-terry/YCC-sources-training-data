defmodule GroupAnagrams do
  def group(words) do
    words
    |> Enum.group_by(fn word ->
      word |> String.graphemes() |> Enum.sort() |> Enum.join()
    end)
    |> Map.values()
  end
end

IO.inspect(GroupAnagrams.group(["eat", "tea", "tan", "ate", "nat", "bat"]))
