import Bitwise

woodall = fn n -> n * (1 <<< n) - 1 end

1..10
|> Enum.map(woodall)
|> Enum.join(" ")
|> IO.puts()
