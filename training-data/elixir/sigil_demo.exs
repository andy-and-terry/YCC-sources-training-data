defmodule Sigils do
  def sigil_i(string, []) do
    string
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end
end

import Sigils

words = ~w(apple banana cherry)
IO.inspect(words)

matches = Regex.scan(~r/[0-9]+/, "room 42 has 7 seats")
IO.inspect(matches)

numbers = ~i(1,2,3,4)
IO.inspect(numbers)
