defmodule SafeDivide do
  def divide(a, 0), do: {:error, :division_by_zero}
  def divide(a, b), do: {:ok, div(a, b)}
end

defmodule Compute do
  def run(a, b, c) do
    with {:ok, x} <- SafeDivide.divide(a, b),
         {:ok, y} <- SafeDivide.divide(x, c) do
      {:ok, y}
    else
      {:error, reason} -> {:error, reason}
    end
  end
end

IO.inspect(Compute.run(100, 5, 2))
IO.inspect(Compute.run(100, 0, 2))
