# Reverse-and-add until a palindrome; count the steps.
defmodule Lychrel do
  def rev(n), do: n |> Integer.to_string() |> String.reverse() |> String.to_integer()

  def steps(n), do: steps(n, 0)

  defp steps(_n, 100), do: -1
  defp steps(n, count) do
    if count > 0 and n == rev(n), do: count, else: steps(n + rev(n), count + 1)
  end
end

IO.puts([56, 57, 59, 79, 89] |> Enum.map(&Lychrel.steps/1) |> Enum.join(" "))
