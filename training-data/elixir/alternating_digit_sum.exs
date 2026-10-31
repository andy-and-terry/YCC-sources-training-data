defmodule AltDigitSum do
  def run(n) do
    n
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.map(fn {d, i} -> if rem(i, 2) == 0, do: d, else: -d end)
    |> Enum.sum()
  end
end

for n <- [1234, 99999, 1000], do: IO.puts("#{n} #{AltDigitSum.run(n)}")
