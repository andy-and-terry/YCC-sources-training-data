# Positive n expressible as a*a + b*b with a, b >= 0.
representable = fn n ->
  Enum.any?(0..n, fn a ->
    a * a <= n and
      (
        b = round(:math.sqrt(n - a * a))
        a * a + b * b == n
      )
  end)
end

IO.puts(1..30 |> Enum.filter(representable) |> Enum.join(" "))
