defmodule LCS do
  def length_of(a, b) do
    a = String.graphemes(a)
    b = String.graphemes(b)

    for i <- 0..length(a) do
      for j <- 0..length(b), do: {i, j}
    end
    |> List.flatten()
    |> Enum.reduce(%{}, fn {i, j}, table ->
      cond do
        i == 0 or j == 0 ->
          Map.put(table, {i, j}, 0)

        Enum.at(a, i - 1) == Enum.at(b, j - 1) ->
          Map.put(table, {i, j}, Map.get(table, {i - 1, j - 1}, 0) + 1)

        true ->
          Map.put(
            table,
            {i, j},
            max(Map.get(table, {i - 1, j}, 0), Map.get(table, {i, j - 1}, 0))
          )
      end
    end)
    |> Map.get({length(a), length(b)})
  end
end

IO.inspect(LCS.length_of("abcde", "ace"))
