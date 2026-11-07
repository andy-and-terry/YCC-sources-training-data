defmodule PlusOne do
  def run(digits) do
    {carry, out} =
      digits
      |> Enum.reverse()
      |> Enum.reduce({1, []}, fn d, {c, acc} -> {div(d + c, 10), [rem(d + c, 10) | acc]} end)

    if carry > 0, do: [carry | out], else: out
  end
end

IO.inspect(PlusOne.run([1, 2, 9])) # [1, 3, 0]
IO.inspect(PlusOne.run([9, 9]))    # [1, 0, 0]
