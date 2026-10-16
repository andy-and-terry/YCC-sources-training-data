list = [1, 2, 3, 2, 1]

IO.inspect(List.delete(list, 2))
IO.inspect(list -- [1, 2])
IO.inspect(list ++ [9])
IO.inspect(List.replace_at(list, 0, :first))
IO.inspect(List.insert_at(list, 2, :mid))
IO.inspect(List.last(list))
IO.inspect(List.duplicate("ab", 3))
IO.inspect(List.keyfind([a: 1, b: 2], :b, 0))
IO.inspect(List.wrap(nil))
IO.inspect(List.zip([[1, 2], [3, 4]]))
