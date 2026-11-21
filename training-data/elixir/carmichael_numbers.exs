# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
defmodule Carmichael do
  def pow_mod(_b, 0, _m), do: 1

  def pow_mod(b, e, m) do
    half = pow_mod(b, div(e, 2), m)
    sq = rem(half * half, m)
    if rem(e, 2) == 1, do: rem(sq * b, m), else: sq
  end

  def prime?(n), do: n > 1 and Enum.all?(2..max(2, trunc(:math.sqrt(n))), &(&1 == n or rem(n, &1) != 0))

  def carmichael?(n) do
    not prime?(n) and Enum.all?(2..(n - 1), fn a -> Integer.gcd(a, n) != 1 or pow_mod(a, n - 1, n) == 1 end)
  end
end

3..2999//2 |> Enum.filter(&Carmichael.carmichael?/1) |> Enum.join(" ") |> IO.puts()
