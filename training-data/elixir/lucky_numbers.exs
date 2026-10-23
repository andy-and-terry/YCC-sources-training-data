defmodule Lucky do
  def numbers(limit), do: sieve(Enum.take_every(1..(limit - 1), 2), 1)

  defp sieve(nums, i) do
    len = length(nums)

    if i < len and Enum.at(nums, i) <= len do
      step = Enum.at(nums, i)

      nums
      |> Enum.with_index(1)
      |> Enum.reject(fn {_value, pos} -> rem(pos, step) == 0 end)
      |> Enum.map(fn {value, _pos} -> value end)
      |> sieve(i + 1)
    else
      nums
    end
  end
end

IO.puts(Enum.join(Lucky.numbers(100), " "))
