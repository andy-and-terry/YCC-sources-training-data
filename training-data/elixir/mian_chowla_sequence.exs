# Greedy sequence whose pairwise sums are all distinct.
{seq, _sums} =
  Enum.reduce_while(1..200, {[], MapSet.new()}, fn cand, {seq, sums} ->
    if length(seq) == 8 do
      {:halt, {seq, sums}}
    else
      fresh = Enum.map(seq ++ [cand], &(&1 + cand))
      fresh_set = MapSet.new(fresh)

      if MapSet.size(fresh_set) == length(fresh) and MapSet.disjoint?(fresh_set, sums) do
        {:cont, {seq ++ [cand], MapSet.union(sums, fresh_set)}}
      else
        {:cont, {seq, sums}}
      end
    end
  end)

IO.puts(Enum.join(seq, " "))
