defmodule Flow do
  def parse(s) do
    case Integer.parse(s) do
      {n, ""} -> {:ok, n}
      _ -> {:error, {:not_int, s}}
    end
  end

  def positive(n) when n > 0, do: {:ok, n}
  def positive(n), do: {:error, {:not_positive, n}}

  def run(s) do
    with {:ok, n} <- parse(s),
         {:ok, p} <- positive(n) do
      {:ok, p * 2}
    else
      {:error, reason} -> {:failed, reason}
    end
  end
end

for s <- ["21", "-4", "x"], do: IO.inspect(Flow.run(s))
