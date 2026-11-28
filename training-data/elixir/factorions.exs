fact = fn d -> Enum.reduce(1..max(d, 1), 1, &*/2) end

1..49_999
|> Enum.filter(fn n -> n |> Integer.digits() |> Enum.map(fact) |> Enum.sum() == n end)
|> IO.inspect()
# [1, 2, 145, 40585]
