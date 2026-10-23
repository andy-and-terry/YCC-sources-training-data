# List module helpers for index-based edits and keyword-style tuples.
letters = ["a", "b", "c", "d"]

IO.inspect(List.insert_at(letters, 2, "X"))
IO.inspect(List.replace_at(letters, 0, "A"))
IO.inspect(List.delete_at(letters, -1))
IO.inspect(List.update_at(letters, 1, &String.upcase/1))
IO.inspect(List.pop_at(letters, 1))

IO.inspect(List.wrap(nil))
IO.inspect(List.wrap(5))
IO.inspect(List.wrap([1, 2]))
IO.inspect(List.flatten([1, [2, [3, [4]]]]))

pairs = [{:a, 1}, {:b, 2}]
IO.inspect(List.keyfind(pairs, :b, 0))
IO.inspect(List.keyreplace(pairs, :a, 0, {:a, 100}))
IO.inspect(List.last([1, 2, 3]))
IO.inspect(List.starts_with?([1, 2, 3], [1, 2]))
