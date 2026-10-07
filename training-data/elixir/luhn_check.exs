defmodule Luhn do
  def valid?(input) do
    s = String.replace(input, " ", "")

    if String.length(s) < 2 or s =~ ~r/\D/ do
      false
    else
      s
      |> String.graphemes()
      |> Enum.reverse()
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index()
      |> Enum.map(fn
        {d, i} when rem(i, 2) == 1 -> if d * 2 > 9, do: d * 2 - 9, else: d * 2
        {d, _} -> d
      end)
      |> Enum.sum()
      |> rem(10) == 0
    end
  end
end

IO.inspect({Luhn.valid?("4539 3195 0343 6467"), Luhn.valid?("8273 1232 7352 0569")})
