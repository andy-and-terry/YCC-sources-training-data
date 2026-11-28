defmodule Rho do
  def factor(n) when rem(n, 2) == 0, do: 2
  def factor(n), do: loop(2, 2, n)

  defp loop(x, y, n) do
    x = f(x, n)
    y = f(f(y, n), n)

    case Integer.gcd(abs(x - y), n) do
      1 -> loop(x, y, n)
      d -> d
    end
  end

  defp f(v, n), do: rem(v * v + 1, n)
end

n = 8051
p = Rho.factor(n)
IO.puts("#{n} = #{p} * #{div(n, p)}")
