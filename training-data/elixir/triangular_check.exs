# n is triangular iff 8n + 1 is a perfect square.
is_triangular = fn n ->
  s = 8 * n + 1
  r = round(:math.sqrt(s))
  r * r == s
end

IO.puts(0..20 |> Enum.filter(is_triangular) |> Enum.join(" "))
