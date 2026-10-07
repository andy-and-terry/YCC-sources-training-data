defmodule SlidingWindowMaximum do
  # Maintains a monotonically decreasing deque of indices: the head always
  # holds the index of the maximum value within the current window.
  def max_sliding_window(nums, k) do
    values = List.to_tuple(nums)
    n = tuple_size(values)

    {_deque, result} =
      Enum.reduce(0..(n - 1), {[], []}, fn i, {deque, result} ->
        v = elem(values, i)

        deque =
          deque
          |> Enum.reverse()
          |> Enum.drop_while(&(elem(values, &1) <= v))
          |> Enum.reverse()
          |> Kernel.++([i])
          |> Enum.drop_while(&(&1 <= i - k))

        if i >= k - 1 do
          {deque, [elem(values, hd(deque)) | result]}
        else
          {deque, result}
        end
      end)

    Enum.reverse(result)
  end
end

IO.inspect(SlidingWindowMaximum.max_sliding_window([1, 3, -1, -3, 5, 3, 6, 7], 3))
