defmodule Duval do
  # Greedy factorization: repeatedly take the longest Lyndon prefix.
  def factor(""), do: []

  def factor(s) do
    len =
      1..String.length(s)
      |> Enum.filter(fn n -> lyndon?(String.slice(s, 0, n)) end)
      |> Enum.max()

    [String.slice(s, 0, len) | factor(String.slice(s, len..-1//1))]
  end

  defp lyndon?(w) do
    n = String.length(w)
    n == 1 or Enum.all?(1..(n - 1), fn i -> w < String.slice(w, i..-1//1) end)
  end
end

IO.inspect(Duval.factor("banana"))
