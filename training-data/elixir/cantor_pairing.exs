# Cantor pairing function and its inverse.
defmodule Cantor do
  def pair(x, y), do: div((x + y) * (x + y + 1), 2) + y

  def unpair(z) do
    w = div(trunc(:math.sqrt(8 * z + 1)) - 1, 2)
    y = z - div(w * (w + 1), 2)
    {w - y, y}
  end
end

IO.puts(Cantor.pair(3, 4))
{x, y} = Cantor.unpair(32)
IO.puts("#{x} #{y}")
