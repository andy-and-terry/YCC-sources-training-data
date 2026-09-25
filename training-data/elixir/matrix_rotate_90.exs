defmodule Matrix do
  def transpose(m), do: m |> Enum.zip() |> Enum.map(&Tuple.to_list/1)
  def rotate_clockwise(m), do: m |> transpose() |> Enum.map(&Enum.reverse/1)
  def rotate_counter_clockwise(m), do: m |> Enum.map(&Enum.reverse/1) |> transpose()
end

m = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
IO.inspect(Matrix.rotate_clockwise(m))
IO.inspect(Matrix.rotate_counter_clockwise(m))
