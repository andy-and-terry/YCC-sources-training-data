defmodule WordBreak do
  def can_break?(s, word_dict) do
    words = MapSet.new(word_dict)
    n = String.length(s)
    memo = %{n => true}
    {result, _memo} = solve(s, 0, n, words, memo)
    result
  end

  defp solve(_s, i, _n, _words, memo) when is_map_key(memo, i) do
    {memo[i], memo}
  end

  defp solve(s, i, n, words, memo) do
    {result, memo} =
      Enum.reduce_while((i + 1)..n, {false, memo}, fn j, {_found, acc_memo} ->
        prefix = String.slice(s, i, j - i)

        if MapSet.member?(words, prefix) do
          {can_rest, acc_memo2} = solve(s, j, n, words, acc_memo)

          if can_rest do
            {:halt, {true, acc_memo2}}
          else
            {:cont, {false, acc_memo2}}
          end
        else
          {:cont, {false, acc_memo}}
        end
      end)

    {result, Map.put(memo, i, result)}
  end
end

IO.inspect(WordBreak.can_break?("leetcode", ["leet", "code"]))
IO.inspect(WordBreak.can_break?("catsandog", ["cats", "dog", "sand", "and", "cat"]))
