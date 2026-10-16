t = {:ok, "data", 3}

IO.inspect(elem(t, 1))
IO.inspect(put_elem(t, 2, 99))
IO.inspect(Tuple.append(t, :extra))
IO.inspect(tuple_size(t))
IO.inspect(Tuple.to_list(t))
IO.inspect(Tuple.delete_at(t, 0))
IO.inspect(Tuple.insert_at({1, 3}, 1, 2))
