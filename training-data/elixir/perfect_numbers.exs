defmodule PerfectNumbers do
  def aliquot_sum(1), do: 0

  def aliquot_sum(n) do
    2..max(2, trunc(:math.sqrt(n)))//1
    |> Enum.filter(&(&1 * &1 <= n and rem(n, &1) == 0))
    |> Enum.reduce(1, fn d, acc -> if d == div(n, d), do: acc + d, else: acc + d + div(n, d) end)
  end

  def classify(n) do
    s = aliquot_sum(n)

    cond do
      s == n -> :perfect
      s > n -> :abundant
      true -> :deficient
    end
  end
end

for n <- [6, 12, 28, 13, 8128], do: IO.puts("#{n} #{PerfectNumbers.classify(n)}")
