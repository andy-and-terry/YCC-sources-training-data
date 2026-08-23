defmodule KMP do
  def search(text, pattern) do
    lps = build_lps(pattern)
    do_search(String.graphemes(text), String.graphemes(pattern), lps, 0, 0, 0)
  end

  defp build_lps(pattern) do
    chars = String.graphemes(pattern)
    n = length(chars)
    lps = List.duplicate(0, n)
    build_lps(chars, lps, 1, 0)
  end

  defp build_lps(_chars, lps, i, _len) when i >= length(lps), do: lps

  defp build_lps(chars, lps, i, len) do
    if Enum.at(chars, i) == Enum.at(chars, len) do
      lps = List.replace_at(lps, i, len + 1)
      build_lps(chars, lps, i + 1, len + 1)
    else
      if len != 0 do
        build_lps(chars, lps, i, Enum.at(lps, len - 1))
      else
        build_lps(chars, lps, i + 1, 0)
      end
    end
  end

  defp do_search(text, pattern, _lps, i, _j, _) when i > length(text) - length(pattern) and i >= length(text), do: -1

  defp do_search(text, pattern, lps, i, j, _) do
    cond do
      j == length(pattern) ->
        i - j

      i < length(text) and Enum.at(text, i) == Enum.at(pattern, j) ->
        do_search(text, pattern, lps, i + 1, j + 1, 0)

      i < length(text) and j > 0 ->
        do_search(text, pattern, lps, i, Enum.at(lps, j - 1), 0)

      i < length(text) ->
        do_search(text, pattern, lps, i + 1, 0, 0)

      true ->
        -1
    end
  end
end

IO.inspect(KMP.search("abxabcabcaby", "abcaby"))
