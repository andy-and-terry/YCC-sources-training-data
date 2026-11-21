# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
bouncy? = fn n ->
  d = Integer.digits(n)
  d != Enum.sort(d) and d != Enum.sort(d, :desc)
end

1..999 |> Enum.count(bouncy?) |> IO.puts()
