defmodule AnagramCheck do
  def anagram?(a, b) do
    normalize(a) == normalize(b)
  end

  defp normalize(str) do
    str
    |> String.downcase()
    |> String.replace(~r/\s+/, "")
    |> String.graphemes()
    |> Enum.sort()
  end
end

IO.inspect(AnagramCheck.anagram?("listen", "silent"))
IO.inspect(AnagramCheck.anagram?("hello", "world"))
