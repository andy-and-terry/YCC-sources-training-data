defmodule MatrixOps do
  def transpose(matrix) do
    matrix
    |> List.zip()
    |> Enum.map(&Tuple.to_list/1)
  end

  def multiply(a, b) do
    bt = transpose(b)

    Enum.map(a, fn row ->
      Enum.map(bt, fn col ->
        Enum.zip(row, col)
        |> Enum.reduce(0, fn {x, y}, acc -> acc + x * y end)
      end)
    end)
  end
end

a = [[1, 2], [3, 4]]
b = [[5, 6], [7, 8]]
IO.inspect(MatrixOps.transpose(a))
IO.inspect(MatrixOps.multiply(a, b))
