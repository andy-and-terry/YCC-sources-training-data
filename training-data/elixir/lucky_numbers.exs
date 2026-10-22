defmodule Lucky do
  def numbers(limit), do: sieve(Enum.take_every(1..limit, 2), 1)

  defp sieve(nums, i) do
    if i < length(nums) and Enum.at(nums, i) <= length(nums) do
      step = Enum.at(nums, i)

      nums
      |> Enum.with_index(1)
      |> Enum.reject(fn {_v, idx} -> rem(idx, step) == 0 end)
      |> Enum.map(&elem(&1, 0))
      |> sieve(i + 1)
    else
      nums
    end
  end
end

IO.puts(Enum.join(Lucky.numbers(50), " "))
