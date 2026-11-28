defmodule Intervals do
  def insert(ivs, {nlo, nhi}) do
    {before, rest} = Enum.split_while(ivs, fn {_, hi} -> hi < nlo end)
    {overlap, after_} = Enum.split_while(rest, fn {lo, _} -> lo <= nhi end)
    lo = Enum.min([nlo | Enum.map(overlap, &elem(&1, 0))])
    hi = Enum.max([nhi | Enum.map(overlap, &elem(&1, 1))])
    before ++ [{lo, hi}] ++ after_
  end
end

IO.inspect(Intervals.insert([{1, 3}, {6, 9}], {2, 5})) # [{1, 5}, {6, 9}]
