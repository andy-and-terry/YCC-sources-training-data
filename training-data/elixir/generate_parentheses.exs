defmodule GenerateParentheses do
  def generate(n) do
    backtrack("", 0, 0, n, [])
  end

  defp backtrack(current, open, close, max, acc) when open == max and close == max do
    [current | acc]
  end

  defp backtrack(current, open, close, max, acc) do
    acc =
      if open < max do
        backtrack(current <> "(", open + 1, close, max, acc)
      else
        acc
      end

    if close < open do
      backtrack(current <> ")", open, close + 1, max, acc)
    else
      acc
    end
  end
end

IO.inspect(GenerateParentheses.generate(3) |> Enum.reverse())
