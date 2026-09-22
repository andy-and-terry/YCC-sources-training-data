defmodule MonotonicStack do
  def next_greater_element(nums) do
    nums
    |> Enum.reverse()
    |> Enum.reduce({[], []}, fn n, {stack, result} ->
      stack = Enum.drop_while(stack, &(&1 <= n))
      next = List.first(stack, -1)
      {[n | stack], [next | result]}
    end)
    |> elem(1)
  end
end

IO.inspect(MonotonicStack.next_greater_element([2, 1, 2, 4, 3, 1]))
