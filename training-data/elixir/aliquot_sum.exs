# Aliquot sum classification.
for n <- [6, 12, 15, 28] do
  a = 1..(n - 1) |> Enum.filter(&(rem(n, &1) == 0)) |> Enum.sum()
  kind = cond do
    a == n -> "perfect"
    a > n -> "abundant"
    true -> "deficient"
  end
  IO.puts("#{n} #{a} #{kind}")
end
