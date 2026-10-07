defmodule PrimeFactorization do
  def factorize(n) when n > 1 do
    factorize(n, 2, [])
  end

  defp factorize(1, _divisor, acc), do: Enum.reverse(acc)

  defp factorize(n, divisor, acc) when divisor * divisor > n do
    Enum.reverse([n | acc])
  end

  defp factorize(n, divisor, acc) when rem(n, divisor) == 0 do
    factorize(div(n, divisor), divisor, [divisor | acc])
  end

  defp factorize(n, divisor, acc) do
    factorize(n, divisor + 1, acc)
  end
end

IO.inspect(PrimeFactorization.factorize(360)) # [2, 2, 2, 3, 3, 5]
IO.inspect(PrimeFactorization.factorize(97))  # [97]
