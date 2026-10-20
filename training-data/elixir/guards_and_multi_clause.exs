defmodule Guards do
  def kind(n) when is_integer(n) and n < 0, do: :negative
  def kind(0), do: :zero
  def kind(n) when is_integer(n) and rem(n, 2) == 0, do: :even
  def kind(n) when is_integer(n), do: :odd
  def kind(s) when is_binary(s) and byte_size(s) > 3, do: :long_string
  def kind(_), do: :other
end

Enum.each([-5, 0, 4, 7, "hello", :atom], fn x -> IO.puts("#{inspect(x)} -> #{Guards.kind(x)}") end)
