defmodule Delta do
  def encode([h | _] = xs), do: [h | Enum.zip_with(xs, tl(xs), fn a, b -> b - a end)]
  def decode(ds), do: Enum.scan(ds, &(&1 + &2))
end

d = Delta.encode([10, 12, 15, 15, 20])
IO.inspect(d)
IO.inspect(Delta.decode(d))
