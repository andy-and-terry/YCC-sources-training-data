# Pronic numbers n(n+1)
defmodule PronicNumbers do
  def term(n), do: n * (n + 1)
end

IO.puts(Enum.map_join(0..9, " ", &PronicNumbers.term/1))
