import Bitwise

cullen = fn n -> n * (1 <<< n) + 1 end

0..9
|> Enum.map(cullen)
|> Enum.join(" ")
|> IO.puts()
