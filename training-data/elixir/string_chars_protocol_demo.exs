defmodule Money do
  defstruct cents: 0
end

defimpl String.Chars, for: Money do
  def to_string(%Money{cents: cents}) do
    dollars = div(cents, 100)
    remainder = cents |> rem(100) |> Integer.to_string() |> String.pad_leading(2, "0")
    "$#{dollars}.#{remainder}"
  end
end

price = %Money{cents: 4250}

IO.puts("Total: #{price}")
IO.inspect(to_string(price))
IO.inspect(Enum.map([%Money{cents: 100}, %Money{cents: 999}], &to_string/1))
