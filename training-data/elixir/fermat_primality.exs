# Fermat primality test; Carmichael number 561 fools it.
defmodule Fermat do
  def powmod(_b, 0, m), do: rem(1, m)

  def powmod(b, e, m) do
    half = powmod(b, div(e, 2), m)
    sq = rem(half * half, m)
    if rem(e, 2) == 0, do: sq, else: rem(sq * b, m)
  end

  def probably_prime?(n), do: n > 2 and powmod(2, n - 1, n) == 1
end

for n <- [97, 91, 561], do: IO.puts("#{n} #{Fermat.probably_prime?(n)}")
