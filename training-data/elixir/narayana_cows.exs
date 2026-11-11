# Narayana's cows N(n)=N(n-1)+N(n-3)
seq =
  Enum.reduce(3..9, [1, 1, 1], fn i, acc ->
    acc ++ [Enum.at(acc, i - 1) + Enum.at(acc, i - 3)]
  end)

IO.puts(Enum.join(seq, " "))
