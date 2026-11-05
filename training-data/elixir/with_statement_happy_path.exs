parse = fn s -> case Integer.parse(s) do {n, ""} -> {:ok, n}; _ -> {:error, :nan} end end

result =
  with {:ok, a} <- parse.("4"),
       {:ok, b} <- parse.("5") do
    {:ok, a * b}
  else
    {:error, r} -> {:failed, r}
  end

IO.inspect(result)
IO.inspect(with {:ok, _} <- parse.("x"), do: :unreachable)
