defmodule Automorphic do
  def automorphic?(n), do: String.ends_with?(Integer.to_string(n * n), Integer.to_string(n))
end

0..999 |> Enum.filter(&Automorphic.automorphic?/1) |> IO.inspect()
# [0, 1, 5, 6, 25, 76, 376, 625]
