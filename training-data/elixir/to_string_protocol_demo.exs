defmodule Money do
  defstruct [:amount, :currency]

  defimpl String.Chars do
    def to_string(%{amount: a, currency: c}) do
      :erlang.float_to_binary(a / 100, decimals: 2) <> " " <> c
    end
  end
end

m = %Money{amount: 1999, currency: "USD"}
IO.puts(m)
IO.puts("Total: #{m}")
IO.puts(to_string(%Money{amount: 5, currency: "EUR"}))
