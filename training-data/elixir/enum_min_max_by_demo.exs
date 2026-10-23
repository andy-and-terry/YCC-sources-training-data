words = ~w(pear fig banana kiwi)

IO.inspect(Enum.min_by(words, &String.length/1))
IO.inspect(Enum.max_by(words, &String.length/1))
IO.inspect(Enum.min_max([4, -9, 2, 7]))
IO.inspect(Enum.min_max_by(words, &String.length/1))
IO.inspect(Enum.max([], fn -> :none end))
IO.inspect(Enum.max_by([%{n: 1, v: 5}, %{n: 2, v: 9}], & &1.v))
