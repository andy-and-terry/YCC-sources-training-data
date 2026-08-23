defmodule PredicateDemo do
  def run do
    numbers = [2, 4, 6, 8, 10]

    IO.inspect(Enum.all?(numbers, &(rem(&1, 2) == 0)))
    IO.inspect(Enum.any?(numbers, &(&1 > 9)))
    IO.inspect(Enum.find(numbers, &(&1 > 5)))
    IO.inspect(Enum.count(numbers, &(&1 > 4)))
    IO.inspect(Enum.zip(numbers, [:a, :b, :c, :d, :e]))
  end
end

PredicateDemo.run()
