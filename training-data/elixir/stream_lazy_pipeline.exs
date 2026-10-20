1..1_000_000
|> Stream.map(&(&1 * 3))
|> Stream.filter(&(rem(&1, 2) == 0))
|> Enum.take(4)
|> IO.inspect()
