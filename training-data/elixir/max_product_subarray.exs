defmodule MaxProduct do
  def max_product([x | rest]) do
    {best, _, _} =
      Enum.reduce(rest, {x, x, x}, fn y, {best, hi, lo} ->
        candidates = [y, hi * y, lo * y]
        hi = Enum.max(candidates)
        {max(best, hi), hi, Enum.min(candidates)}
      end)

    best
  end
end

IO.inspect(Enum.map([[2, 3, -2, 4], [-2, 0, -1], [-2, 3, -4]], &MaxProduct.max_product/1))
