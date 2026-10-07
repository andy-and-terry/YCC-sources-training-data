t = {:ok, 42, "answer"}

IO.inspect(tuple_size(t))
IO.inspect(elem(t, 1))
IO.inspect(put_elem(t, 1, 43))
IO.inspect(Tuple.to_list(t))
IO.inspect(List.to_tuple([1, 2, 3]))
IO.inspect(Tuple.append(t, :extra))
IO.inspect(Tuple.insert_at(t, 0, :first))
IO.inspect(Tuple.delete_at(t, 2))

pairs = [{:a, 1}, {:b, 2}]
IO.inspect(Map.new(pairs))
IO.inspect(Enum.unzip(pairs))
IO.inspect(Enum.zip([:x, :y], [10, 20]))
IO.inspect(List.keyfind(pairs, :b, 0))
IO.inspect(List.keyreplace(pairs, :a, 0, {:a, 100}))

{status, value, _} = t
IO.inspect({status, value})
