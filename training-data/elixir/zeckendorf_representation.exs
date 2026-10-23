defmodule Zeckendorf do
  def represent(target) do
    fibs =
      Stream.unfold({1, 2}, fn {a, b} -> {a, {b, a + b}} end)
      |> Enum.take_while(&(&1 <= target))

    {parts, _rest} =
      fibs
      |> Enum.reverse()
      |> Enum.reduce({[], target}, fn f, {acc, n} ->
        if f <= n, do: {[f | acc], n - f}, else: {acc, n}
      end)

    Enum.reverse(parts)
  end
end

100 |> Zeckendorf.represent() |> Enum.join(" ") |> IO.puts()
