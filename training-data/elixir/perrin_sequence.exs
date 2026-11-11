# Perrin sequence P(n)=P(n-2)+P(n-3)
seq =
  Enum.reduce(3..9, [3, 0, 2], fn i, acc ->
    acc ++ [Enum.at(acc, i - 2) + Enum.at(acc, i - 3)]
  end)

IO.puts(Enum.join(seq, " "))
