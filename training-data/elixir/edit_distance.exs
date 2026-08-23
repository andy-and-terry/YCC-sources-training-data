defmodule EditDistance.Impl do
  def distance(a, b) do
    a = String.graphemes(a)
    b = String.graphemes(b)
    m = length(a)
    n = length(b)

    first_row = for j <- 0..n, into: %{}, do: {{0, j}, j}

    table =
      Enum.reduce(1..m, first_row, fn i, acc ->
        acc = Map.put(acc, {i, 0}, i)

        Enum.reduce(1..n, acc, fn j, acc2 ->
          cost = if Enum.at(a, i - 1) == Enum.at(b, j - 1), do: 0, else: 1

          val =
            Enum.min([
              Map.get(acc2, {i - 1, j}) + 1,
              Map.get(acc2, {i, j - 1}) + 1,
              Map.get(acc2, {i - 1, j - 1}) + cost
            ])

          Map.put(acc2, {i, j}, val)
        end)
      end)

    Map.get(table, {m, n})
  end
end

IO.inspect(EditDistance.Impl.distance("kitten", "sitting"))
