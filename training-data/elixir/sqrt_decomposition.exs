defmodule SqrtSum do
  defstruct [:a, :bs, :blk]

  def new(list, bs) do
    blk = list |> Enum.chunk_every(bs) |> Enum.map(&Enum.sum/1)
    %__MODULE__{a: List.to_tuple(list), bs: bs, blk: List.to_tuple(blk)}
  end

  def query(t, l, r), do: go(t, l, r, 0)

  defp go(_, i, r, acc) when i > r, do: acc

  defp go(t, i, r, acc) do
    if rem(i, t.bs) == 0 and i + t.bs - 1 <= r do
      go(t, i + t.bs, r, acc + elem(t.blk, div(i, t.bs)))
    else
      go(t, i + 1, r, acc + elem(t.a, i))
    end
  end
end

IO.puts(SqrtSum.query(SqrtSum.new([5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5], 4), 2, 9))
