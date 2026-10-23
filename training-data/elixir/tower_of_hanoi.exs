defmodule Hanoi do
  @doc "Returns the list of {from, to} moves needed to shift n disks."
  def moves(0, _from, _to, _via), do: []

  def moves(n, from, to, via) do
    moves(n - 1, from, via, to) ++ [{from, to}] ++ moves(n - 1, via, to, from)
  end
end

moves = Hanoi.moves(3, :a, :c, :b)

moves
|> Enum.with_index(1)
|> Enum.each(fn {{from, to}, i} ->
  IO.puts("Move #{i}: #{from} -> #{to}")
end)

IO.puts("Total: #{length(moves)} moves (2^3 - 1 = #{Integer.pow(2, 3) - 1})")
