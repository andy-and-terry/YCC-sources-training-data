defmodule V do
  def parse(s), do: Integer.parse(s) |> case do {n, ""} -> {:ok, n}; _ -> {:error, :nan} end
end

r = with {:ok, a} <- V.parse("4"), {:ok, b} <- V.parse("x") do
  {:ok, a + b}
else
  {:error, why} -> {:failed, why}
end

IO.inspect(r)
