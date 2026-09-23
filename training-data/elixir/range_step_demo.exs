defmodule RangeStepDemo do
  def even_range(from, to) do
    Enum.to_list(from..to//2)
  end

  def countdown(from, to) do
    Enum.to_list(from..to//-1)
  end
end

IO.inspect(RangeStepDemo.even_range(2, 10)) # [2, 4, 6, 8, 10]
IO.inspect(RangeStepDemo.countdown(5, 1))   # [5, 4, 3, 2, 1]
IO.inspect(Enum.sum(1..20//3))              # 1 + 4 + 7 + 10 + 13 + 16 + 19 = 70
