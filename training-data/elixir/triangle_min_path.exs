defmodule Triangle do
  def minimum_total(rows) do
    [bottom | rest] = Enum.reverse(rows)

    rest
    |> Enum.reduce(bottom, fn row, below ->
      pairs = Enum.zip(below, tl(below))
      Enum.zip_with(row, pairs, fn v, {l, r} -> v + min(l, r) end)
    end)
    |> hd()
  end
end

IO.puts(Triangle.minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])) # 11
