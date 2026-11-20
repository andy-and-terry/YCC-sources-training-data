# Wilson's theorem primality test.
defmodule Wilson do
  def prime?(n) when n < 2, do: false
  def prime?(n), do: Enum.reduce(2..(n - 1)//1, 1, fn i, f -> rem(f * i, n) end) == n - 1
end

IO.inspect(Enum.filter(2..19, &Wilson.prime?/1))
