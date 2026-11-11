# Amicable pairs: d(a) == b and d(b) == a with a != b.
defmodule Amicable do
  def d(n), do: Enum.sum(for i <- 1..(n - 1)//1, rem(n, i) == 0, do: i)
end

for a <- 2..1499, b = Amicable.d(a), b > a, Amicable.d(b) == a do
  IO.puts("#{a} #{b}")
end
