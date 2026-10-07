defmodule Saddle do
  def points([]), do: []

  def points(m) do
    col_mins = m |> Enum.zip() |> Enum.map(&(&1 |> Tuple.to_list() |> Enum.min()))

    for {row, r} <- Enum.with_index(m),
        row_max = Enum.max(row),
        {v, c} <- Enum.with_index(row),
        v == row_max and v == Enum.at(col_mins, c),
        do: {r, c}
  end
end

IO.inspect(Saddle.points([[9, 8, 7], [5, 3, 2], [6, 6, 7]]))
