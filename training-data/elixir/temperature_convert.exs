defmodule Temperature do
  def convert(v, from, to), do: v |> to_celsius(from) |> from_celsius(to)

  defp to_celsius(v, :c), do: v
  defp to_celsius(v, :f), do: (v - 32) * 5 / 9
  defp to_celsius(v, :k), do: v - 273.15

  defp from_celsius(v, :c), do: v
  defp from_celsius(v, :f), do: v * 9 / 5 + 32
  defp from_celsius(v, :k), do: v + 273.15
end

IO.puts(Float.round(Temperature.convert(100, :c, :f) * 1.0, 2))
IO.puts(Float.round(Temperature.convert(212, :f, :k) * 1.0, 2))
