defmodule Flow do
  def run(a, b) do
    with {:ok, x} <- parse(a),
         {:ok, y} <- parse(b) do
      {:ok, x + y}
    else
      {:error, reason} -> {:error, "bad: #{reason}"}
    end
  end

  defp parse(s) do
    case Integer.parse(s) do
      {n, ""} -> {:ok, n}
      _ -> {:error, s}
    end
  end
end

IO.inspect(Flow.run("1", "2"))
IO.inspect(Flow.run("1", "z"))
