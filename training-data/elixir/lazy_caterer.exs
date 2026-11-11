# Lazy caterer sequence: max pieces from n cuts
defmodule LazyCaterer do
  def term(n), do: div((n * (n + 1)), 2) + 1
end

IO.puts(Enum.map_join(0..9, " ", &LazyCaterer.term/1))
