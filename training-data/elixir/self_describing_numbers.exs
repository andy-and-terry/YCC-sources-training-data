defmodule SelfDescribing do
  def check?(n) do
    digits = Integer.digits(n)

    digits
    |> Enum.with_index()
    |> Enum.all?(fn {d, i} -> Enum.count(digits, &(&1 == i)) == d end)
  end
end

for n <- [1210, 2020, 21200, 1211], do: IO.puts("#{n} #{SelfDescribing.check?(n)}")
