people = [{"Zed", 40}, {"Amy", 22}, {"Bob", 31}]

IO.inspect(Enum.sort_by(people, &elem(&1, 1)))
IO.inspect(Enum.sort_by(people, &elem(&1, 1), :desc))
IO.inspect(Enum.min_by(people, &elem(&1, 1)))
IO.inspect(Enum.max_by(people, &String.length(elem(&1, 0))))
IO.inspect(Enum.sort([3, 1, 2], &>=/2))
IO.inspect(Enum.uniq_by([1, 2, 3, 4, 5], &rem(&1, 3)))
IO.inspect(Enum.frequencies(~w(a b a c b a)))
