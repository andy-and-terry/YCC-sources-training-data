# Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
defmodule Keith do
  def keith?(n) do
    digits = Integer.digits(n)
    go(Enum.reverse(digits), length(digits), n)
  end

  # seq is kept reversed (newest first)
  defp go([last | _] = seq, k, n) do
    cond do
      last >= n -> last == n
      true -> go([seq |> Enum.take(k) |> Enum.sum() | seq], k, n)
    end
  end
end

10..1199 |> Enum.filter(&Keith.keith?/1) |> Enum.join(" ") |> IO.puts()
