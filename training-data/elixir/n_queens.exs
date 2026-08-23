defmodule NQueens do
  def solve(n) do
    place([], n)
  end

  defp place(queens, n) when length(queens) == n, do: [Enum.reverse(queens)]

  defp place(queens, n) do
    for col <- 0..(n - 1), safe?(queens, col), reduce: [] do
      acc -> acc ++ place([col | queens], n)
    end
  end

  defp safe?(queens, col) do
    queens
    |> Enum.with_index(1)
    |> Enum.all?(fn {q, dist} -> q != col and abs(q - col) != dist end)
  end
end

solutions = NQueens.solve(6)
IO.inspect(length(solutions))
