defmodule Farey do
  def sequence(n), do: ["0/1" | build(0, 1, 1, n, n)]

  defp build(_a, _b, c, _d, n) when c > n, do: []

  defp build(a, b, c, d, n) do
    k = div(n + b, d)
    ["#{c}/#{d}" | build(c, d, k * c - a, k * d - b, n)]
  end
end

IO.puts(Enum.join(Farey.sequence(5), " "))
