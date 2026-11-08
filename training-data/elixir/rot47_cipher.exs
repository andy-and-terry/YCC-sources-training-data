defmodule Rot47 do
  def rot47(s) do
    s
    |> String.to_charlist()
    |> Enum.map(fn c when c in 33..126 -> 33 + rem(c - 33 + 47, 94); c -> c end)
    |> List.to_string()
  end
end

e = Rot47.rot47("Hello, World!")
IO.puts("#{e} #{Rot47.rot47(e)}")
