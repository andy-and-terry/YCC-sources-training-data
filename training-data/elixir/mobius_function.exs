# Moebius function: 0 if n has a squared prime factor, else (-1)^k.
defmodule Mobius do
  def of(n), do: go(n, 2, 1)

  defp go(m, p, acc) when p * p > m, do: if(m > 1, do: -acc, else: acc)

  defp go(m, p, acc) when rem(m, p) == 0 do
    m2 = div(m, p)
    if rem(m2, p) == 0, do: 0, else: go(m2, p + 1, -acc)
  end

  defp go(m, p, acc), do: go(m, p + 1, acc)
end

1..30 |> Enum.map(&Mobius.of/1) |> Enum.join(" ") |> IO.puts()
