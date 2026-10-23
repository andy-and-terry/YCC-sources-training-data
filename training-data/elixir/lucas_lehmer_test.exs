import Bitwise

defmodule LucasLehmer do
  def prime?(2), do: true

  def prime?(p) do
    m = (1 <<< p) - 1

    final =
      Enum.reduce(1..(p - 2), 4, fn _, s -> rem(s * s - 2, m) end)

    final == 0
  end
end

[2, 3, 5, 7, 11, 13, 17, 19]
|> Enum.filter(&LucasLehmer.prime?/1)
|> Enum.join(" ")
|> IO.puts()
