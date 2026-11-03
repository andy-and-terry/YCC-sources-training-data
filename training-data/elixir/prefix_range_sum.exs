defmodule RangeSum do
  def new(values), do: Enum.scan(values, 0, &+/2) |> then(&[0 | &1]) |> List.to_tuple()
  def query(prefix, lo, hi), do: elem(prefix, hi) - elem(prefix, lo)
end

prefix = RangeSum.new([3, 1, 4, 1, 5, 9, 2, 6])
IO.puts(RangeSum.query(prefix, 2, 5))
