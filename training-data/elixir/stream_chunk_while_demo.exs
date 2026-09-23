defmodule ChunkByBudget do
  def batches(numbers, budget) do
    numbers
    |> Stream.chunk_while(
      {[], 0},
      fn n, {chunk, total} ->
        if total + n > budget and chunk != [] do
          {:cont, Enum.reverse(chunk), {[n], n}}
        else
          {:cont, {[n | chunk], total + n}}
        end
      end,
      fn
        {[], _total} -> {:cont, []}
        {chunk, _total} -> {:cont, Enum.reverse(chunk), []}
      end
    )
    |> Enum.to_list()
  end
end

IO.inspect(ChunkByBudget.batches([4, 3, 5, 2, 8, 1, 1, 9], 10))
