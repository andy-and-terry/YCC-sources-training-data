defmodule Primes do
  def count_below(n) when n < 3, do: 0

  def count_below(n) do
    2..(n - 1)
    |> Enum.reduce(MapSet.new(2..(n - 1)), fn i, set ->
      if MapSet.member?(set, i) and i * i < n do
        Enum.reduce((i * i)..(n - 1)//i, set, &MapSet.delete(&2, &1))
      else
        set
      end
    end)
    |> MapSet.size()
  end
end

IO.puts(Primes.count_below(100))
