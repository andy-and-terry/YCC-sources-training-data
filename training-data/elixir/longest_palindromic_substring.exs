defmodule LongestPalindromicSubstring do
  def find(s) do
    chars = String.to_charlist(s)
    len = length(chars)

    if len == 0 do
      ""
    else
      {start, finish} =
        0..(len - 1)
        |> Enum.reduce({0, 0}, fn i, {best_start, best_end} ->
          {s1, e1} = expand(chars, len, i, i)
          {s2, e2} = expand(chars, len, i, i + 1)

          [{best_start, best_end}, {s1, e1}, {s2, e2}]
          |> Enum.max_by(fn {s, e} -> e - s end)
        end)

      chars
      |> Enum.slice(start, finish - start + 1)
      |> List.to_string()
    end
  end

  defp expand(chars, len, left, right) do
    if left >= 0 and right < len and Enum.at(chars, left) == Enum.at(chars, right) do
      expand(chars, len, left - 1, right + 1)
    else
      {left + 1, right - 1}
    end
  end
end

IO.inspect(LongestPalindromicSubstring.find("babad"))
IO.inspect(LongestPalindromicSubstring.find("cbbd"))
IO.inspect(LongestPalindromicSubstring.find("a"))
