# Practical numbers: every m in 1..n is a sum of distinct divisors of n.
import Bitwise

is_practical = fn n ->
  reach =
    for d <- 1..n, rem(n, d) == 0, reduce: 1 do
      acc -> acc ||| acc <<< d
    end

  mask = (1 <<< (n + 1)) - 1
  (reach &&& mask) == mask
end

1..40 |> Enum.filter(is_practical) |> Enum.join(" ") |> IO.puts()
