1..1_000_000
|> Stream.filter(&(rem(&1, 7) == 0))
|> Stream.map(&(&1 * 2))
|> Enum.take(5)
|> IO.inspect()
