defmodule TrappingRainWater do
  def trap(heights) do
    do_trap(heights |> Enum.with_index(), 0, length(heights) - 1, 0, 0, 0)
  end

  defp do_trap(_heights, left, right, _left_max, _right_max, water) when left >= right do
    water
  end

  defp do_trap(heights, left, right, left_max, right_max, water) do
    {left_val, _} = Enum.at(heights, left)
    {right_val, _} = Enum.at(heights, right)

    if left_val < right_val do
      new_left_max = max(left_max, left_val)
      do_trap(heights, left + 1, right, new_left_max, right_max, water + new_left_max - left_val)
    else
      new_right_max = max(right_max, right_val)
      do_trap(heights, left, right - 1, left_max, new_right_max, water + new_right_max - right_val)
    end
  end
end

IO.puts(TrappingRainWater.trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
