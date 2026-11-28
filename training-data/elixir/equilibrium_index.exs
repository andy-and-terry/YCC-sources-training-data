defmodule Equilibrium do
  def index(nums) do
    total = Enum.sum(nums)
    prefix = Enum.scan(nums, &+/2)

    nums
    |> Enum.zip(prefix)
    |> Enum.find_index(fn {v, upto} -> upto - v == total - upto end)
    |> Kernel.||(-1)
  end
end

IO.inspect(Equilibrium.index([1, 7, 3, 6, 5, 6])) # 3
