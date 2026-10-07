defmodule LongestPalindromicSubstring do
  def find(s) do
    chars = String.graphemes(s)
    len = length(chars)

    Enum.reduce(0..(len - 1), "", fn i, best ->
      odd = expand(chars, len, i, i)
      even = expand(chars, len, i, i + 1)
      [odd, even, best] |> Enum.max_by(&String.length/1)
    end)
  end

  defp expand(chars, len, left, right) when left >= 0 and right < len do
    if Enum.at(chars, left) == Enum.at(chars, right) do
      expand(chars, len, left - 1, right + 1)
    else
      chars |> Enum.slice((left + 1)..(right - 1)) |> Enum.join()
    end
  end

  defp expand(chars, _len, left, right) do
    chars |> Enum.slice((left + 1)..(right - 1)) |> Enum.join()
  end
end

IO.puts(LongestPalindromicSubstring.find("babad"))
IO.puts(LongestPalindromicSubstring.find("cbbd"))
